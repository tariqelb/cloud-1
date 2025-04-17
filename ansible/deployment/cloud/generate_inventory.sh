#!/bin/bash

# Terraform outputs file path
OUTPUTS="../../../terraform/deploy_machine_on_gcp/env/ansible_env_vars.json"

echo "Generating inventory.yaml from Terraform outputs..."

# Activate Python environment (if needed)
source ../../installation_script/ansible-env/bin/activate

# Read the JSON values from the Terraform outputs
vm_instance_ip=$(jq -r '.vm_instance_ip.value' $OUTPUTS)
vm_user=$(jq -r '.vm_user.value' $OUTPUTS)

# Create the inventory.yaml file with proper formatting
cat <<EOF > inventory.yaml
cloud:
  hosts:
    cloud1:
      ansible_host: $vm_instance_ip
      ansible_user: $vm_user
      ansible_ssh_private_key_file: "~/.ssh/id_rsa"
EOF

# Deactivate Python environment (if activated)
deactivate

echo "inventory.yaml generated successfully!"

