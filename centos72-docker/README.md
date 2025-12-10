# CentOS 7.2 Docker Vagrant Build

This build can be used if you want to create a local CentOS 7.2 VM with Docker installed
for development purposes. This project can be used as a template for other projects
that require a Docker environment.

## Commands used for building box

```bash
###
# This project uses a base vm that I build on my local PC. This allows me to
# install the VBGuest Additions I need depending on the version of VirtualBox I am
# running.
#
# REF: http://srvtrkwebd07.basspro.net:7990/projects/VAB/repos/centos72/browse
#
###

# Initialize the vagrant project
$ vagrant init centos-7.2-base # I use a local base image for all my builds

###
# Referrence Vagrantfile for VM build
###
$ vagrant up # Start the build of the VM box

# log into the system once the buid has been successful
$ vagrant ssh
```