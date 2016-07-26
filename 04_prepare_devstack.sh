#!/bin/sh

set -x

git clone --depth 1 https://git.openstack.org/openstack-dev/devstack /devstack -b stable/mitaka
# Rally with DevStack all-in-one installation
# see https://rally.readthedocs.io/en/latest/install.html#rally-with-devstack-all-in-one-installation
git clone --depth 1 https://github.com/openstack/rally
# create the stack user
/devstack/tools/create-stack-user.sh

chown -R stack:stack /devstack


