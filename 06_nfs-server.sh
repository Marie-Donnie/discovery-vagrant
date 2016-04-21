#!/bin/bash

## nfs server (speed up the clone)
apt-get install -y nfs-kernel-server
cat > /etc/exports <<- EOM
/opt/stack/cinder *(rw,sync,no_subtree_check,no_root_squash)
/opt/stack/glance *(rw,sync,no_subtree_check,no_root_squash)
/opt/stack/horizon *(rw,sync,no_subtree_check,no_root_squash)
/opt/stack/nova *(rw,sync,no_subtree_check,no_root_squash)
/opt/stack/noVNC *(rw,sync,no_subtree_check,no_root_squash)
/opt/stack/tempest *(rw,sync,no_subtree_check,no_root_squash)
EOM

service nfs-kernel-server restart
