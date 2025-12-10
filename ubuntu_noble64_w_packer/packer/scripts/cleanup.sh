#!/bin/bash
set -eux
apt-get -y clean
rm -rf /var/lib/cloud/instances/*
cloud-init clean --logs
rm -rf /tmp/*
sync