#!/bin/sh

# This is run as root
DEBIAN_FRONTEND=noninteractive apt-get -y update 
DEBIAN_FRONTEND=noninteractive apt-get install -y git 

git clone -b stable/mitaka https://git.openstack.org/openstack-dev/devstack /devstack
# create the stack user
/devstack/tools/create-stack-user.sh

chown -R stack:stack /devstack


