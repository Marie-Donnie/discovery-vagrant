#!/bin/bash
# should be used using the stack user
# on vagrant we can use the vagrant user

dir=$(cd $(dirname "$0") && pwd)
export LC_ALL=en_US.UTF-8

# get faster mirrors
cat > /etc/apt/sources.list <<- EOM 
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse
EOM

apt-get -y update 
apt-get install -y python-pip python-dev git
# get rome
pushd /tmp
git clone https://github.com/BeyondTheClouds/rome.git
pushd rome
python setup.py install

apt-get install -y python-numpy
pip install -r requirements.txt
mkdir -p /etc/rome
popd
popd
cp $dir/rome.conf /etc/rome/rome.conf

# rome requires /opt/logs to be writtable.
mkdir /opt/logs
chown stack:stack /opt/logs
chmod -R a+w /opt/logs
