#!/bin/bash
# should be used using the stack user
# on vagrant we can use the vagrant user

dir=$(cd $(dirname "$0") && pwd)
export LC_ALL=en_US.UTF-8

# get faster mirrors
# cat > /etc/apt/sources.list <<- EOM
# deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse
# deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse
# deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse
# deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse
# EOM

apt-get -y update
apt-get install -y python3-pip python3-dev git

aptitude install debian-archive-keyring


apt update
pip3 install -U pip
