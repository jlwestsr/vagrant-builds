## Vagrant CentOS 7.1 Base Box Build VirtualBox Client 4.3.12

This is a base build of CentOS 7.1 server platform for development use.

## Purpose

This build is for the purspose of supporting the VirtualBox version 4.3.12 which is needed for BPS Windows 7 desktops as the security hardening causes
issues with usign the latest versions of VirtualBox. **This is a Windows issue with Trend Micro Office installed.**

VirtualBox 4.3.12 client - http://download.virtualbox.org/virtualbox/4.3.12/

VirtualBox 4.3.12 Discussion of Problems due to Hardened Security - https://forums.virtualbox.org/viewtopic.php?f=6&t=67840

**Commands used during build process**

```sh
# Vagrant (https://www.vagrantup.com/) CentOS 7 Base Build
# These are the commands used to build the vagrant centos-7-base box.

# Get initial VM built and running
$ vagrant init boxcutter/centos71
$ vagrant up

# VirtualBox v4.3.12
# Needed for BPS Windows 7 Platform as issues with hardened security prevents latest release of VirtualBox from being installed. 
#
# Version 4.3.14 VBox Guest Additions is used due to issues with v4.3.12 of the guest additions not compiling correctly.
vagrant:~$ mkdir tmp
vagrant:~$ cd tmp
vagrant:~$ sudo wget -c http://download.virtualbox.org/virtualbox/4.3.14/VBoxGuestAdditions_4.3.14.iso -O VBoxGuestAdditions_4.3.14.iso
vagrant:~$ sudo mount ~/tmp/VBoxGuestAdditions_4.3.14.iso -o loop /mnt 
vagrant:~$ cd /mnt
vagrant:~$ sudo sh VBoxLinuxAdditions.run --nox11
vagrant:~$ exit

# Reload VM
$ vagrant reload
$ vagrant ssh

# Package box
vagrant:~$ exit
$ vagrant package --output bps-centos71-base-vbc4312_1.0.0.box

# Add box to local vagrant repo for new boxes
$ vagrant box add centos71-base bps-centos71-base-vagvbc4312.box
```