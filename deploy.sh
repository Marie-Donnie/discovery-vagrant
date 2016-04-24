#!/bin/sh

set -e

vagrant up pop0
vagrant ssh pop0 -c 'sudo /vagrant/01_vagrant.sh'
vagrant ssh pop0 -c 'sudo /vagrant/02_rome.sh'
vagrant ssh pop0 -c 'sudo /vagrant/03_redis.sh'
vagrant ssh pop0 -c 'sudo /vagrant/04_prepare_devstack.sh'
vagrant ssh pop0 -c 'sudo -i -u stack /vagrant/05_devstack.sh'
vagrant ssh pop0 -c 'sudo /vagrant/06_nfs-server.sh'

