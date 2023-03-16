# ⚠️ DEPRECATION NOTICE
Since I've switched to NixOS a couple of years ago, I no longer maintain this repository.

# Arch-bootstrap

This project aims to bootstrap my Arch Linux development environment laptop.

## Installation

Bootstrapping is performed by Ansible. So the first step is to install Ansible:

```sh
pacman -S ansible
```

Once ansible is installed, clone this repo to the root of your home folder.

## Bootstraping

To bootstrap your Arch Linux installation, run:

```sh
~/arch-bootstrap/bin/arch-bootstrap
```

Ansible will ask for your SUDO password. Type it in and go get a cup of coffee. When bootstraping completes, reboot your machine.
