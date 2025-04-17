#!/bin/bash

read -sp "Enter sudo password: " Password
echo

echo "------------------- Updating system packages -------------------"
echo $Password | sudo -S apt update

# Install common dependencies only if not installed
for pkg in software-properties-common python3-venv ansible; do
    if ! dpkg -s $pkg >/dev/null 2>&1; then
        echo "Installing $pkg..."
        echo $Password | sudo -S apt install -y $pkg
    else
        echo "$pkg is already installed."
    fi
done

# Add Ansible PPA only if not already added
if ! grep -q "ansible" /etc/apt/sources.list /etc/apt/sources.list.d/* 2>/dev/null; then
    echo "Adding Ansible PPA..."
    echo $Password | sudo -S add-apt-repository --yes --update ppa:ansible/ansible
else
    echo "Ansible PPA already exists."
fi

# Create and activate virtual environment
if [ ! -d "ansible-env" ]; then
    echo "Creating virtual environment in ./ansible-env..."
    python3 -m venv ansible-env
else
    echo "Virtual environment already exists."
fi

echo "Activating virtual environment..."
source ansible-env/bin/activate

# Install Python packages inside the venv
echo "Installing Ansible Docker tools in virtualenv..."
pip install --upgrade pip
pip install ansible docker
pip install yq # yq user for generate inventory yaml file from json file

echo "Installing community.docker Ansible collection..."
ansible-galaxy collection install community.docker

echo "deactivating virtual environment..."
deactivate
echo "------------------- Installation complete -------------------"

