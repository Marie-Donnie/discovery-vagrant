#!/bin/sh

set -x

apt-get -y update 
apt-get install -y git 

git clone --depth 1 https://git.openstack.org/openstack-dev/devstack /devstack -b stable/mitaka
# create the stack user
/devstack/tools/create-stack-user.sh

chown -R stack:stack /devstack


