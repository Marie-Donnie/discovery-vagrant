#!/bin/sh

vagrant up
vagrant ssh -c 'sudo /vagrant/01_prepare.sh &&\
  sudo /vagrant/01_vagrant.sh &&\
  sudo -i -u stack /vagrant/02_start.sh &&\
  /vagrant/03_rome.sh'

