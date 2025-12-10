#!/usr/bin/env bash

apt-get update
apt-get upgrade -y
apt-get install -y -q puppet puppetmaster facter
apt-get autoremove -y