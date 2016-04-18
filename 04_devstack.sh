#!/bin/sh

set -x

# should be used using the stack user
# on vagrant we can use the vagrant user

cd /devstack
echo '[[local|localrc]]' > local.conf
echo ADMIN_PASSWORD=admin >> local.conf
echo DATABASE_PASSWORD=admin >> local.conf
echo RABBIT_PASSWORD=admin >> local.conf
echo SERVICE_PASSWORD=admin >> local.conf
echo HOST_IP=141.10.10.141 >> local.conf
echo FLAT_INTERFACE=eth1 >> local.conf
echo FLOATING_RANGE=141.10.10.196/26 >> local.conf
echo FIXED_RANGE=10.11.12.0/24 >> local.conf
echo FIXED_NETWORK_SIZE=256 >> local.conf
echo NOVA_REPO=https://github.com/msimonin/nova.git >> local.conf
echo NOVA_BRANCH=disco/mitaka >> local.conf
echo RECLONE=no >> local.conf
./stack.sh
