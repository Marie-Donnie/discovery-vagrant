#!/bin/sh

set -x

# should be used using the stack user
# on vagrant we can use the vagrant user


cd /devstack

# /devstack/tools/create-stack-user.sh


# clone only the required branch to save time
# see https://bugs.launchpad.net/devstack/+bug/1412244
# sed -i 's/git_timed clone $git_clone_flags $git_remote $git_dest$/& -b $git_ref/' functions-common

# XXX: Workaround for the abscence of flavor with redis backend. See,
# https://github.com/BeyondTheClouds/Wiki/issues/14. This workaround
# is fixed in the latest version of devstack. Henceforth, we could
# remove this for Newton.
# https://github.com/openstack-dev/devstack/blob/8e5417e876a4c29dc9fb60659fa4c011bbb43d99/lib/nova#L929
echo "
if ! openstack --os-region-name='$REGION_NAME' flavor list | grep -q m1.tiny; then
  openstack --os-region-name='$REGION_NAME' flavor create --id 1 --ram 512 --disk 1 --vcpus 1 m1.tiny
  openstack --os-region-name='$REGION_NAME' flavor create --id 2 --ram 2048 --disk 20 --vcpus 1 m1.small
  openstack --os-region-name='$REGION_NAME' flavor create --id 3 --ram 4096 --disk 40 --vcpus 2 m1.medium
  openstack --os-region-name='$REGION_NAME' flavor create --id 4 --ram 8192 --disk 80 --vcpus 4 m1.large
  openstack --os-region-name='$REGION_NAME' flavor create --id 5 --ram 16384 --disk 160 --vcpus 8 m1.xlarge
fi" >> /devstack/stack.sh

./unstack.sh
./stack.sh
