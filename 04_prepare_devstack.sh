#!/bin/sh

set -x

apt-get -y update 
apt-get install -y git 

git clone -b stable/mitaka https://git.openstack.org/openstack-dev/devstack /devstack
# create the stack user
/devstack/tools/create-stack-user.sh

chown -R stack:stack /devstack


