#!/bin/bash

read -sp "Enter sudo password: " Password
echo

echo $Password | sudo -S apt update
echo $Password | sudo -S apt install software-properties-common
echo $Password | sudo -S add-apt-repository --yes --update ppa:ansible/ansible
echo $Password | sudo -S apt install ansible
