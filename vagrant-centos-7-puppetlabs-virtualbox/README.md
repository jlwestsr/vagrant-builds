# Vagrant CentOS 7 by PuppetLabs for VirtualBox

This is the base build.

**Commands used to build box**

```sh
# Vagrant (https://www.vagrantup.com/) CentOS 7 Base Build
# These are the commands used to build the vagrant centos-7-base box.

# Packages & Software Installed
#
# VirtualBox Version: 5.0.14 (https://www.virtualbox.org/)
# Guest Additions Version: 5.0.14 (http://download.virtualbox.org/virtualbox/5.0.14/VBoxGuestAdditions_5.0.14.iso)

# Get initial VM built and running
$ vagrant init centos/7
$ vagrant up
$ vagrant ssh

# Update platform
vagrant:~$ sudo yum -y update

# Puppet Labs does not correctly set the password for the vagrant profile. We have to change the password to documentedsudo 
# correct version
vagrant:~$ sudo su
vagrant:~$ passwd vagrant # Set password to 'vagrant' with no quotes

# Reload Console
vagrant:~$ exit
$ vagrant ssh

# Install basic needed packages
vagrant:~$ sudo yum -y install git vim wget zsh kernel kernel-devel

# Install VB Guest Additions
# ISO provided in project folder

# VirtualBox v5.0.14
# OSX or Linux platforms
#vagrant:~$ sudo wget -c http://download.virtualbox.org/virtualbox/5.0.14/VBoxGuestAdditions_5.0.14.iso -O VBoxGuestAdditions_5.0.14.iso
vagrant:~$ sudo mount /vagrant/VBoxGuestAdditions_5.0.14.iso -o loop /mnt 
# OR #
# VirtualBox v4.3.12
# Needed for BPS Windows 7 Platform as issues with hardened security prevents latest release of VirtualBox from being installed. 
#vagrant:~$ sudo wget -c http://download.virtualbox.org/virtualbox/4.3.14/VBoxGuestAdditions_4.3.14.iso -O VBoxGuestAdditions_4.3.14.iso
vagrant:~$ sudo mount ~/tmp/VBoxGuestAdditions_4.3.14.iso -o loop /mnt 
vagrant:~$ cd /mnt
vagrant:~$ sudo sh VBoxLinuxAdditions.run --nox11
vagrant:~$ exit

# Reload VM
$ vagrant reload
$ vagrant ssh

# Install oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)
# Prefrence insall of ZSH PROMPT instead of BASH PROMPT - Used for inline Git tools
vagrant:~$ sudo yum -y install zsh
vagrant:~$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Password = vagrant
vagrant:~$ vim ~/.zshrc # Edit line 8: ZSH_THEME = "mh"

# Reload Console
vagrant:~$ exit
$ vagrant ssh

# Install nvm (https://github.com/creationix/nvm)
vagrant:~$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash

# Relog into console
vagrant:~$ exit 
$ vagrant ssh

# Install nodejs (https://nodejs.org/en/)
vagrant:~$ nvm install v5.5.0
vagrant:~$ nvm alias default v5.5.0
vagrant:~$ node --version # should be v5.5.0
# RECOMMENDED: Install expressjs (http://expressjs.com/en/)
vagrant:~$ npm install -g express
# OPTIONAL: Install express-generator (http://expressjs.com/en/starter/generator.html)
vagrant:~$ npm install -g express-generator

# Install rbenv (https://github.com/rbenv/rbenv) & ruby-install
vagrant:~$ git clone https://github.com/rbenv/rbenv.git ~/.rbenv
vagrant:~$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
vagrant:~$ echo 'eval "$(rbenv init -)"' >> ~/.zshrc

# Relog into console
vagrant:~$ exit
$ vagrant ssh

# Install ruby-install (https://github.com/rbenv/ruby-build)
# Needed packages for ruby builds
vagrant:~$ sudo yum install -y gcc bzip2 openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel
vagrant:~$ git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install ruby (http://ruby-lang.org)
vagrant:~$ rbenv install 2.3.0
vagrant:~$ rbenv global 2.3.0 # sets the version to use globally
vagrant:~$ ruby --version # should be 2.3.0
# OPTIONAL: Install Ruby on Rails (http://rubyonrails.org)
vagrant:~$ gem install rails

# Install java (http://www.oracle.com) from rpm provided in project folder
vagrant:~$ sudo yum -y localinstall jdk-8u72-linux-x64.rpm

# Package box
vagrant:~$ exit
$ vagrant package --output puppet-centos-7-base.box

# Add box to local vagrant repo for new boxes
$ vagrant box add puppet-centos-7-base puppet-centos-7-base.box
```