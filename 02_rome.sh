#!/bin/bash
# should be used using the stack user
# on vagrant we can use the vagrant user

dir=$(cd $(dirname "$0") && pwd)
export LC_ALL=en_US.UTF-8

apt-get -y update 
apt-get install -y python-pip python-dev git
# get rome
pushd /tmp
git clone https://github.com/BeyondTheClouds/rome.git
pushd rome
python setup.py install

pip install numpy
pip install -r requirements.txt
mkdir -p /etc/rome
popd
popd
cp $dir/rome.conf /etc/rome/rome.conf

# rome requires /opt/logs to be writtable.
#mkdir /opt/logs
#chown stack:stack /opt/logs
