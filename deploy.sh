#!/bin/sh

set -e

vagrant up
vagrant ssh -c 'sudo /vagrant/01_vagrant.sh'
vagrant ssh -c 'sudo /vagrant/02_rome.sh'
vagrant ssh -c 'sudo /vagrant/03_prepare_devstack.sh'
vagrant ssh -c 'sudo -i -u stack /vagrant/04_devstack.sh'

