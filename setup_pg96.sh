#!/bin/bash

wget https://yum.postgresql.org/9.6/redhat/rhel-7.2-x86_64/pgdg-centos96-9.6-3.noarch.rpm
rpm -ivh pgdg-centos96-9.6-3.noarch.rpm
yum -y install postgresql96-server postgresql96-devel postgresql96-contrib

/usr/pgsql-9.6/bin/postgresql96-setup initdb
systemctl enable postgresql-9.6.service
systemctl start postgresql-9.6.service
