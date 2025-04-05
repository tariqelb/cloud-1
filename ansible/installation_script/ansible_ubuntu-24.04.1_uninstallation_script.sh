#!/bin/bash

read -sp "Enter sudo password: " Password
echo

echo "------------------- Starting uninstallation -------------------"

echo "Uninstalling community.docker Ansible collection..."
ansible-galaxy collection remove community.docker

# Deactivate virtual environment if active
if [[ "$VIRTUAL_ENV" != "" ]]; then
    echo "Deactivating active virtual environment..."
    deactivate
fi

# Remove virtual environment
if [ -d "ansible-env" ]; then
    echo "Removing virtual environment at ./ansible-env..."
    rm -rf ansible-env
else
    echo "No virtual environment found at ./ansible-env"
fi

# Optionally remove Ansible PPA
echo "Removing Ansible PPA (if present)..."
echo "$Password" | sudo -S add-apt-repository --remove --yes ppa:ansible/ansible 2>/dev/null

# Remove Ansible and dependencies if installed
for pkg in ansible software-properties-common python3-venv; do
    if dpkg -s $pkg >/dev/null 2>&1; then
        echo "Removing package: $pkg"
        echo "$Password" | sudo -S apt remove --purge -y $pkg
    else
        echo "$pkg is not installed, skipping..."
    fi
done


# Clean up orphaned packages and cache
echo "$Password" | sudo -S apt autoremove -y
echo "$Password" | sudo -S apt clean

echo "------------------- Uninstallation complete -------------------"

