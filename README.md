# vagrant-builds

A collection of Vagrant examples, base boxes, and helper scripts for building and testing virtual machine images.

## Overview

This repository contains multiple Vagrant projects and related packaging/playbook files used to build, test, and demonstrate Vagrant boxes and VM setups. Each top-level folder generally represents an independent Vagrant project (base boxes, example projects, or provisioning demos).

## Prerequisites

- Install Vagrant: https://www.vagrantup.com/
- Install a provider such as VirtualBox or libvirt (depending on the projects you run).
- Recommended: `git` to clone the repository.

## Quick start

1. Clone the repository (if you haven't already):

```bash
git clone <repo-url>
cd vagrant-builds
```

2. Run an example (for example, the MongoDB Vagrant project):

```bash
cd vagrant-mongodb
vagrant up
# then: vagrant ssh
```

3. To destroy the running VM when finished:

```bash
vagrant destroy -f
```

Note: some folders include additional bootstrap scripts or box files; consult the folder's README for project-specific instructions.

## Repository structure (high level)

- `aem-centos71/`, `centos71/`, `centos72/`, ... - Various base box and OS-focused projects
- `drone/` - Drone CI packaging, CLI and server sources
- `vagrant-*` - Example Vagrant projects and demos
- `packer/` - Packer definitions and scripts for building images
- `boxes/` - (may contain) pre-built box files

For more detail about a particular example, open that folder and read its `README.md` or `Vagrantfile`.

## Contributing

Contributions are welcome. Suggested workflow:

1. Fork the repository
2. Add or edit example projects under a new or existing folder
3. Open a pull request describing your changes

If you want a more comprehensive `README` for a specific project in this repo (for example `drone/` or `vagrant-mongodb/`), tell me which folder and I'll add or expand it.

## License

See project-level files for licensing. If no license file is present, assume "all rights reserved" and request clarification before reusing code.

---

Generated on December 10, 2025.
