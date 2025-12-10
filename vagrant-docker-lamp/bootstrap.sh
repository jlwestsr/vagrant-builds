#!/usr/bin/env bash

apt-get update
apt-get upgrade -y
apt-get install -y -q build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison libpq-dev make libgdbm-dev libffi-dev pkg-config wget unzip git
apt-get install -y -q libsqlite3-dev sqlite3 libmysqlclient-dev
apt-get install -y -q subversion 
apt-get install -y -q vim nano gawk
apt-get install -y -q nodejs 
#apt-get install -y -q mysql-server mysql-client  