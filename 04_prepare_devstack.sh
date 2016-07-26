#!/bin/sh

set -x

git clone --depth 1 https://git.openstack.org/openstack-dev/devstack /devstack -b stable/mitaka
# create the stack user
/devstack/tools/create-stack-user.sh

chown -R stack:stack /devstack


