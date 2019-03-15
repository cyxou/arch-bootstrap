#!/bin/bash

if ! command -v ansible >/dev/null; then
    echo "Installing Ansible dependencies..."
    sudo apt-get update -qq
    sudo apt-get install --yes -qq --no-install-recommends software-properties-common
    echo "Adding Ansible PPA repository..."
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
    sudo apt-get update -qq
    echo "Installing Ansible..."
    sudo apt-get install --yes -qq --no-install-recommends ansible
fi
