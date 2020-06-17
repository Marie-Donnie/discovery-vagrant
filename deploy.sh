#!/bin/sh

set -e

#sudo /vagrant/01_vagrant.sh
sudo 02_rome.sh
sudo 03_redis.sh
sudo 04_prepare_devstack.sh
sudo -i -u stack 05_devstack.sh
sudo 06_nfs-server.sh
