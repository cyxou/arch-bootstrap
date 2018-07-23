#!/bin/bash

if ! command -v ansible >/dev/null; then
    echo "Installing Ansible dependencies..."
    sudo apt-get update -qq
    sudo apt-get install --yes -qq --no-install-recommends software-properties-common
    echo "Adding Ansible PPA repository..."
    sudo apt-add-repository --yes ppa:ansible/ansible
    sudo apt-get update -qq
    echo "Installing Ansible..."
    sudo apt-get install --yes -qq --no-install-recommends ansible
fi