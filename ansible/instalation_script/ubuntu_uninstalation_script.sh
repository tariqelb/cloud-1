#!/bin/bash

read -sp "Enter sudo password: " Password
echo

echo $Password | sudo -S apt remove --purge ansible -y
echo $Password | sudo -S add-apt-repository --remove --yes ppa:ansible/ansible
echo $Password | sudo -S apt autoremove -y
echo $Password | sudo -S apt autoclean

