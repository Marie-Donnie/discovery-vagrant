#!/bin/sh

set -x

# should be used using the stack user
# on vagrant we can use the vagrant user

cd /devstack

cat > local.conf <<- EOM
[[local|localrc]]
ADMIN_PASSWORD=admin
DATABASE_PASSWORD=admin
RABBIT_PASSWORD=admin
SERVICE_PASSWORD=admin
HOST_IP=141.10.10.141
FLAT_INTERFACE=eth1
FLOATING_RANGE=141.10.10.196/26
FIXED_RANGE=10.11.12.0/24
FIXED_NETWORK_SIZE=256
GIT_DEPTH=1
NOVA_REPO=https://github.com/BeyondTheClouds/nova
NOVA_BRANCH=disco/mitaka
RECLONE=no
enable_plugin rally https://github.com/openstack/rally master

# Discovery configurations
[[post-config|\$NOVA_CONF]]
[discovery]
db_backend = redis
gen_logs = False
EOM

# clone only the required branch to save time
# see https://bugs.launchpad.net/devstack/+bug/1412244
sed -i 's/git_timed clone $git_clone_flags $git_remote $git_dest$/& -b $git_ref/' functions-common

sudo service redis-server stop
sudo rm /var/lib/redis/dump.rdb
sudo service redis-server start

./unstack.sh
./stack.sh
