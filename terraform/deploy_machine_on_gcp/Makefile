#Terraform Basic command Makefile

all:
	# Initialize Terraform (only once)
	terraform init
plan:
	# Preview what will be created
	terraform plan
apply:
	# Create the infra (like VMs, firewalls, etc.)
	terraform apply
	# Show all Terraform outputs (VM IP, ID)
	terraform output
destroy:
	# Destroy everything later to save cloud costs
	terraform destroy
	rm -rf .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
clean:
	#Clean init command result
	rm -rf .terraform .terraform.lock.hcl

show-outputs:
	# Show all Terraform outputs
	terraform output
