#!/bin/bash

## redis
apt-get install -y redis-server
echo "bind 0.0.0.0" >> /etc/redis/redis.conf
service redis-server restart
