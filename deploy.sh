#!/bin/sh

set -e

#sudo /vagrant/01_vagrant.sh
sudo /vagrant/02_rome.sh
sudo /vagrant/03_redis.sh
sudo /vagrant/04_prepare_devstack.sh
sudo -i -u stack /vagrant/05_devstack.sh
sudo /vagrant/06_nfs-server.sh
