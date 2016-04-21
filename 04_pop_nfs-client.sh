#!/bin/sh

set -x

apt-get install nfs-common
service="cinder glance horizon nova noVNC tempest"
for s in $service
do
  mkdir -p /opt/stack/$s
  mount -t nfs -o rw 141.10.10.141:/opt/stack/$s /opt/stack/$s
done;
