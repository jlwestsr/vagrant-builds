# == Class: baseconfig
#
# Performs initial configuration tasks for all Vagrant boxes
#
class baseconfig {
  
  # update apt-get repositories
  exec { "update":
    command => "apt-get update";
  }

  # install base packages
  package { [   
            "build-essential",
            "curl",
            "git",
            "mercurial",
            "python-software-properties",
            "software-properties-common",
            "subversion",
            "vim",
            "zsh"
        ]:
        ensure  => present,
        require => Exec["update"];
    }

    host { "hostmachine":
        ip => "192.168.0.1";
    }

}