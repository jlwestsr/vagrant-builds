# Ubuntu 24.04 Vagrant Box

A Vagrant configuration for building and managing an Ubuntu 24.04 (Noble Numbat) virtual machine box with automated cloud-init provisioning.

## Overview

This project simplifies the creation and deployment of Ubuntu 24.04 virtual machines using Vagrant. It includes a pre-configured cloud-init configuration (`user-data`) that automates the initial setup of the virtual environment with a standard Vagrant user account.

## Project Structure

```
ubuntu_noble64/
├── Vagrantfile              # Vagrant configuration
├── boxes/                   # Directory for built Vagrant boxes
│   └── ubuntu2404.box      # Built box file (after running build)
├── http/                    # Cloud-init and HTTP metadata
│   ├── user-data           # Cloud-init configuration for automated setup
│   └── meta-data           # Instance metadata
├── scripts/                # Provisioning scripts (placeholder)
└── README.md              # This file
```

## Prerequisites

- **Vagrant** (version 2.0+) - [Download](https://www.vagrantup.com/downloads)
- **VirtualBox** (recommended) or other Vagrant-supported provider
- At least 2GB of available RAM
- ~20GB of free disk space for the ISO and box file

## Quick Start

1. **Initialize the VM:**
   ```bash
   vagrant up
   ```

2. **Connect via SSH:**
   ```bash
   vagrant ssh
   ```

3. **Stop the VM:**
   ```bash
   vagrant halt
   ```

4. **Destroy the VM:**
   ```bash
   vagrant destroy
   ```

## Configuration Details

### Cloud-Init Setup

The `http/user-data` file contains cloud-init configuration that automatically:
- Sets hostname to `ubuntu2404`
- Creates a `vagrant` user with sudo privileges (no password required)
- Configures locale to `en_US.UTF-8`
- Sets keyboard layout to US
- Configures networking via DHCP
- Enables SSH with password authentication
- Sets up LVM storage partitioning
- Installs essential packages (linux-generic, build tools, etc.)

### Vagrant User

- **Username:** vagrant
- **Password:** vagrant
- **Sudo:** Passwordless sudo access enabled

## Customization

### VM Resources

To customize VM resources (memory, CPU), edit the `Vagrantfile`:

```ruby
config.vm.provider "virtualbox" do |vb|
  vb.memory = "2048"
  vb.cpus = 2
  vb.gui = false  # Set to true to display VirtualBox window
end
```

### Network Configuration

To enable networking, uncomment and configure in the `Vagrantfile`:

```ruby
# Private network
config.vm.network "private_network", ip: "192.168.33.10"

# Forwarded port
config.vm.network "forwarded_port", guest: 80, host: 8080
```

### Provisioning

Add provisioning scripts to the `scripts/` directory and reference them in the `Vagrantfile`:

```ruby
config.vm.provision "shell", path: "scripts/setup.sh"
```

## Building a Custom Box

To create a reusable Vagrant box from this configuration:

1. Start the VM:
   ```bash
   vagrant up
   ```

2. Connect and customize as needed:
   ```bash
   vagrant ssh
   ```

3. Package the box:
   ```bash
   vagrant package --output boxes/ubuntu2404.box
   ```

4. Add the box locally:
   ```bash
   vagrant box add ubuntu2404 boxes/ubuntu2404.box --force
   ```

## Troubleshooting

### Box not found
Ensure the `ubuntu2404` box is available. You may need to build it using the steps above or adjust the box name in the `Vagrantfile`.

### SSH connection issues
- Verify the VM is running: `vagrant status`
- Check SSH configuration: `vagrant ssh-config`
- Ensure host machine has SSH client installed

### Memory/performance issues
- Increase allocated memory in the `Vagrantfile` provider section
- Check host machine resources availability
- Consider enabling hardware acceleration in VirtualBox

## Resources

- [Vagrant Documentation](https://www.vagrantup.com/docs)
- [Cloud-init Documentation](https://cloud-init.io/docs/)
- [Ubuntu 24.04 Release Notes](https://wiki.ubuntu.com/NobleNumbat/ReleaseNotes)
- [VirtualBox Documentation](https://www.virtualbox.org/manual/)

## License

This configuration is provided as-is for development and testing purposes.
