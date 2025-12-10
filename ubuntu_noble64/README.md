# Ubuntu 24.04 Vagrant Box

A lightweight Vagrant configuration for provisioning an Ubuntu 24.04 LTS development environment with essential tools and shell customization.

## Overview

This Vagrant setup creates a VirtualBox virtual machine with Ubuntu 24.04 (Noble) pre-configured with:
- Essential development tools (build-essential, git, curl, wget, vim)
- Modern shell experience with Zsh and Oh My Zsh
- 4GB RAM and 2 CPU cores
- Automated provisioning and setup

## Prerequisites

- [Vagrant](https://www.vagrantup.com/downloads) (version 2.0 or later)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) (or another supported provider)
- At least 5GB free disk space for the VM
- Internet connection for downloading the base image and dependencies

## Quick Start

1. **Clone or navigate to this directory:**
   ```bash
   cd ubuntu_noble64
   ```

2. **Start the VM:**
   ```bash
   vagrant up
   ```
   This command will:
   - Download the Ubuntu 24.04 cloud image
   - Create and configure the VirtualBox VM
   - Install all essential packages
   - Set up Zsh and Oh My Zsh

3. **SSH into the VM:**
   ```bash
   vagrant ssh
   ```

4. **Halt the VM when done:**
   ```bash
   vagrant halt
   ```

## Configuration Details

### VM Specifications
- **Image:** Ubuntu 24.04 LTS (cloud-image)
- **Hostname:** ubuntu-24.04
- **Memory:** 4096 MB (4GB)
- **CPUs:** 2 cores
- **Provider:** VirtualBox

### Installed Packages
- **Build Tools:** `build-essential`
- **Version Control:** `git`
- **Utilities:** `curl`, `wget`, `vim`
- **Shell:** `zsh`, `oh-my-zsh`

## Common Commands

| Command | Description |
|---------|-------------|
| `vagrant up` | Start and provision the VM |
| `vagrant ssh` | Connect to the VM via SSH |
| `vagrant halt` | Stop the VM gracefully |
| `vagrant reload` | Restart the VM and rerun provisioning |
| `vagrant destroy` | Delete the VM |
| `vagrant status` | Check the current VM status |
| `vagrant provision` | Rerun provisioning scripts |

## Customization

To modify the VM configuration:

1. **Edit the Vagrantfile** to change:
   - VM name, memory, or CPU allocation
   - Additional packages to install
   - Provisioning scripts

2. **Rebuild the VM:**
   ```bash
   vagrant destroy
   vagrant up
   ```

## Troubleshooting

### VirtualBox not found
Ensure VirtualBox is installed and added to your system PATH.

### Image download fails
Check your internet connection and ensure the cloud-image repository is accessible.

### Provisioning script fails
SSH into the VM and check logs:
```bash
vagrant ssh
sudo tail -f /var/log/syslog
```

## License

This Vagrant configuration is provided as-is for development and testing purposes.

## Notes

- The default vagrant user's shell is set to Zsh for a better development experience
- Oh My Zsh is automatically installed upon first provisioning
- The VM uses VirtualBox as the default provider; other providers may require configuration adjustments
