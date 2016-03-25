#!/bin/bash
# should be used using the stack user
# on vagrant we can use the vagrant user

dir=$(cd $(dirname "$0") && pwd)
export LC_ALL=en_US.UTF-8
# get rome
pushd /tmp
git clone https://github.com/badock/rome.git 
pushd rome
sudo python setup.py install
sudo pip install -r requirements.txt
sudo mkdir -p /etc/rome
popd
popd
sudo cp $dir/rome.conf /etc/rome/rome.conf
sudo mkdir /opt/logs
sudo chown stack:stack /opt/logs

## redis
sudo apt-get install -y redis-server
sudo service redis-server restart
