# CentOS 7.2 Base Build

This is a base build of CentOS 7.1 platform for development use. 

There are two versions of the box build to accomidate the different version of the VirtualBox client platforms.

* OSX 10 -
* Windows -

## Commands used during build process

```sh
# Vagrant (https://www.vagrantup.com/) CentOS 7.2 Base Build
# These are the commands used to build the vagrant centos-7-base box.

# Packages & Software Installed
#
# VirtualBox Version: 5.0.26 (https://www.virtualbox.org/)
# Guest Additions Version: 5.0.26 (http://download.virtualbox.org/virtualbox/5.0.14/VBoxGuestAdditions_5.0.14.iso)

# Get initial VM built and running
$ vagrant init boxcutter/centos72
$ vagrant up

# Update platform - See bootstrap.sh ran as a provider in Vagrantfile
# vagrant:~$ sudo yum -y update
# Install basic needed packages
# vagrant:~$ sudo yum -y install git vim wget curl zsh kernel kernel-devel gcc

# After server is properly provisioned reload instance to implement correct kernel
$ vagrant reload

# Using vagrant-vbguest plugin - Mac OS only
# This will install the proper VirtualBox Guest Additions into the instance
$ vagrant vbguest

# On successful install of VirtualBox Guest Additions reload instance
$ vagrant reload

# Manual Install VB Guest Additions - Windows OS Only
# Windows 7 platforms can only run VirtualBox 4.3.12 due to a hardening issue with the current
# McAfee virus protection client. This can process can be skipped on Mac OS platforms.
#
#vagrant:~$ mkdir tmp
#vagrant:~$ cd tmp
#
# install needed packages for vbguest addons
#
#vagrant:~$ sudo yum install -y kernel kernel-headers kernel-devel kernel-firmware make gcc gcc-c++ libgcc
#
# Change ISO name to the version of the VirtualBox installed on client
# 4.3.12 ISO has issues with compiling. Use 4.3.14 ISO to successfuly compile VBoxGuestAdditions
#
#vagrant:~$ wget -c http://download.virtualbox.org/virtualbox/4.3.14/VBoxGuestAdditions_4.3.14.iso -O VBoxGuestAdditions_4.3.14.iso
#vagrant:~$ sudo mount ~/tmp/VBoxGuestAdditions_4.3.14.iso -o loop /mnt
#vagrant:~$ cd /mnt
#vagrant:~$ sudo sh VBoxLinuxAdditions.run --nox11
#vagrant:~$ exit

# Reload VM
#$ vagrant reload

# SSH into instance
$ vagrant ssh

# Install oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)
# Prefrence insall of ZSH PROMPT instead of BASH PROMPT - Used for inline Git tools
vagrant:~$ sudo yum -y install zsh
vagrant:~$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Password = vagrant
vagrant:~$ vim ~/.zshrc # Edit line 8: ZSH_THEME = "mh"

# Package box
vagrant:~$ exit
$ vagrant package --output centos-72-base.box

# NOTE!
# If you are trying to update an existing box first remove the box from the local repo
$ vagrant box remove -f centos-72-base

# Add box to local vagrant repo for new boxes
$ vagrant box add centos-72-base centos-72-base.box
```