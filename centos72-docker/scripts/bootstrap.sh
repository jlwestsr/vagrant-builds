#!/usr/bin/env bash

red='\e[0;31m'
orange='\e[0;33m'
green='\e[0;32m'
end='\e[0m'

echo -e "---->${green}Installing Docker via script${end}"
# Install docker 
curl -fsSL https://get.docker.com/ | sh

echo -e "---->${green}Adding vagrant user to docker security group${end}"
# Add vagrant user to docker security group
gpasswd -a vagrant docker

echo -e "---->${green}Add Docker service to start on boot${end}"
# Add docker service to start on boot
chkconfig docker on

echo -e "---->${green}Restarting the vagrant service${end}"
# Restart vagrant service
service docker restart