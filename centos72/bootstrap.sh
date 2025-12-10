#!/usr/bin/env bash

red='\e[0;31m'
orange='\e[0;33m'
green='\e[0;32m'
end='\e[0m'

echo -e "---->${green}Running package updates${end}"
# run package updates
yum -y update

echo -e "---->${green}Install needed packages${end}"
# install needed packages
yum -y install git vim wget curl zsh kernel kernel-devel gcc git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel gdbm-devel ncurses-devel openssl-devel make bzip2 autoconf automake libtool bison sqlite-devel

echo -e "Yum Package Cleanup"
# package cleanup
yum -y autoremove

echo -e "OS Info"
# os info
uname -a