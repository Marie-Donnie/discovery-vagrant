#!/bin/sh

set -x

DIRECTORY="/devstack"
if [ ! -d "$DIRECTORY" ]; then
    git clone --depth 1 https://git.openstack.org/openstack-dev/devstack /devstack -b stable/train
else
    echo "devstack is already here"
fi

cd /devstack


cat > local.conf <<- EOM
[[local|localrc]]
ADMIN_PASSWORD=admin
DATABASE_PASSWORD=admin
RABBIT_PASSWORD=admin
SERVICE_PASSWORD=admin
HOST_IP=141.10.10.141
HOST_IPV6=fe80::a00:27ff:fe3b:ff31
HOST_IP_IFACE=eth1
FLOATING_RANGE=141.10.10.196/26
FIXED_RANGE=10.11.12.0/24
FIXED_NETWORK_SIZE=256
GIT_DEPTH=1
RECLONE=no
EOM

if id "stack" >/dev/null 2>&1; then
    echo "stack user already exists"
else
    /usr/sbin/useradd -d /home/stack -m stack
    adduser stack sudo
fi


chmod ugo+rwx /devstack/local.conf


chown -R stack:stack /devstack
