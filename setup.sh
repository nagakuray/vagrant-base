#!/bin/bash

DB_TYPE="postgresql"


ln -sf /dev/null /etc/udev/rules.d/70-persistent-net.rules

# Network setting
systemctl enable network
systemctl restart network

# Clock setting
# cat << TIME > /etc/sysconfig/clock
# ZONE="Asia/Tokyo"
# UTC="false"
# TIME
# source /etc/sysconfig/clock
# cp -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# Init install
yum -y upgrade
yum groupinstall -y "Development Tools"
yum install -y vim wget docker

# DB install
if [[ ${DB_TYPE} = "postgresql" ]]; then
  bash /vagrant/setup_pg96.sh
elif [[ ${DB_TYPE} = "mysql" ]]; then
  bash /vagrant/setup_mysql.sh
fi

# Nginx install
cat << "NGINX" > /etc/yum.repos.d/nginx.repo
[nginx]
name=nginx
baseurl=http://nginx.org/packages/rhel/7/x86_64/
gpgcheck=0
enabled=1
NGINX

# User setting
useradd -d /home/vagrant2 -p vagrant2 -s /bin/bash vagrant2
