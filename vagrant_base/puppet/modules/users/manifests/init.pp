# == Class: users
#
# Performs initial configuration tasks for all Vagrant boxes
#
# TODO: Refactor into a class for reuse with other users. 
#
class users {

	# Install oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)
	exec { "clone oh-my-zsh":
		cwd 		=> "/home/vagrant",
		command => "git clone https://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh",
		creates => "/home/vagrant/.oh-my-zsh",
		require => Package["git","zsh"];
	}

	# Setup zsh files and directory permissions
	file { 

		# Change owner, group and permissions to user
		"/home/vagrant/.oh-my-zsh":
			ensure 	=> directory,
			owner 	=> "vagrant",
			group 	=> "vagrant",
			mode 		=> "0644",
			require => Exec["clone oh-my-zsh"];

		# User's bin directory
		"/home/vagrant/bin":
			ensure 	=> directory,
			owner 	=> "vagrant",
			group 	=> "vagrant",
			mode 		=> "0644",
			require => Exec["clone oh-my-zsh"];

		# Copy default .zshrc file
		"/home/vagrant/.zshrc":
			owner 	=> "vagrant",
			group 	=> "vagrant",
			mode 		=> "0644",
			source 	=> "puppet:///modules/users/zshrc",
			require => Exec["clone oh-my-zsh"];

		# Copy defeult .zshenv file
		"/home/vagrant/.zshenv":
			owner 	=> "vagrant",
			group 	=> "vagrant",
			mode 		=> "0644",
			source 	=> "puppet:///modules/users/zshenv",
			require => Exec["clone oh-my-zsh"];	
	}

	# Change the user's shell 
	user { "vagrant":
	  ensure  => present,
	  shell   => "/bin/zsh",
	  require => File["/home/vagrant/.zshrc"];
	}

}