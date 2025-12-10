#!/usr/bin/env bash

# Install Java SDK
yum -y localinstall /vagrant/files/jdk-8u72-linux-x64.rpm
java -version