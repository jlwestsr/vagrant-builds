packer {
  required_plugins {
    virtualbox = {
      version = ">= 1.1.3"
      source  = "github.com/hashicorp/virtualbox"
    }
    vagrant = {
      version = ">= 1.1.6"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}

variable "iso_path" {
  type    = string
  default = "./ubuntu-24.04.3-live-server-amd64.iso"
}

variable "iso_checksum" {
  type    = string
  default = "sha256:c3514bf0056180d09376462a7a1b4f213c1d6e8ea67fae5c25099c6fd3d8274b"
}

source "virtualbox-iso" "ubuntu" {
  vm_name              = "ubuntu-2404-vagrant"
  iso_url              = var.iso_path
  iso_checksum         = var.iso_checksum
  cpus                 = 2
  memory               = 2048
  disk_size            = 40000
  guest_os_type        = "Ubuntu_64"
  hard_drive_interface = "sata"
  gfx_controller       = "vmsvga"
  gfx_vram_size        = 32
  vboxmanage = [
    ["modifyvm", "{{.Name}}", "--natpf1", "ssh,tcp,,2222,,22"],
    ["modifyvm", "{{.Name}}", "--audio", "none"],
    ["modifyvm", "{{.Name}}", "--usb", "off"],
    ["modifyvm", "{{.Name}}", "--vram", "32"]
  ]

  http_directory = "http"
  boot_wait      = "5s"
  boot_command   = [
    "e<down><down><down><end>",
    "autoinstall ds=nocloud-net;s=http://{{.HTTPIP}}:{{.HTTPPort}}/",
    "<enter><wait>",
    "<f10>"
  ]

  ssh_username           = "vagrant"
  ssh_password           = "vagrant"
  ssh_timeout            = "30m"
  shutdown_command      = "echo 'vagrant' | sudo -S shutdown -P now"
}

build {
  sources = ["source.virtualbox-iso.ubuntu"]

  provisioner "shell" {
    scripts = [
      "scripts/cleanup.sh"
    ]
    execute_command = "echo 'vagrant' | sudo -S bash {{ .Path }}"
  }

  # Minimize disk usage
  provisioner "shell" {
    inline = [
      "sudo dd if=/dev/zero of=/EMPTY bs=1M || true",
      "sudo rm -f /EMPTY",
      "sync"
    ]
  }

  post-processor "vagrant" {
    keep_input_artifact = false
    output              = "../ubuntu2404-noble-virtualbox.box"
    compression_level   = 9
  }
}