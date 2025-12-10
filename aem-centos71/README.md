## Adobe Experience Manager CentOS 7.1 Development Environment

Adobe Experience Manager (AEM) CentOS 7.1 development environment build using Vagrant and Oracle VirtualBox.

**BUILD NOTES**

```sh
# These are the custom commands used in bulding the base AEM CentOS 7.1 box using the BPS CentOS 7.1 Base box.

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
vagrant:~$ nvm install v5.6.0
vagrant:~$ nvm alias default v5.6.0
vagrant:~$ node --version # should be v5.6.0
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
```