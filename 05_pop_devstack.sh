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
KEYSTONE_AUTH_URI=http://141.10.10.141:5000/v2.0
HOST_IP=141.10.10.142
FLAT_INTERFACE=eth1
NOVA_REPO=https://github.com/BeyondTheClouds/nova
NOVA_BRANCH=disco/mitaka
RECLONE=no
disable_service horizon
disable_service c-api
disable_service c-sch
disable_service c-vol
disable_service g-api
disable_service g-reg
disable_service key
disable_service key-access
disable_service rabbitmq
disable_service tempest

[[post-config|\$NOVA_CONF]]
[oslo_messaging_rabbit]
rabbit_hosts=141.10.10.141
[keystone_authtoken]
memcached_servers = 141.10.10.141:11211
auth_uri = http://141.10.10.141:5000
auth_url = http://141.10.10.141:35357
[glance]
api_servers = http://141.10.10.141:9292
EOM

./unstack.sh
./stack.sh
