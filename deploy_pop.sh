#!/bin/sh

set -e

vagrant up pop1
vagrant ssh pop1 -c 'sudo /vagrant/01_vagrant.sh'
vagrant ssh pop1 -c 'sudo /vagrant/02_rome.sh'
vagrant ssh pop1 -c 'sudo /vagrant/04_prepare_devstack.sh'
vagrant ssh pop1 -c 'sudo /vagrant/04_pop_nfs-client.sh'
vagrant ssh pop1 -c 'sudo -i -u stack /vagrant/05_pop_devstack.sh'

