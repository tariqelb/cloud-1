# Ansible automation Makefile

all: inventory install-deps deploy check

install-deps:
	echo ">>> Running install-deps"
	#For sudo password check terraform.tfvars for ssh_password in terraform folder
	ansible-playbook -i ./inventory.yaml check-and-install-depemdencies-playbook.yaml  --ask-become-pass

deploy:
	echo ">>> Running deploy"
	#For sudo password check terraform.tfvars for ssh_password in terraform folder
	ansible-playbook -i ./inventory.yaml deploy-app-playbook.yaml  --ask-become-pass

check:
	echo ">>> Running check"
	#For sudo password check terraform.tfvars for ssh_password in terraform folder
	ansible-playbook -i ./inventory.yaml check-containers-health-playbook.yaml  --ask-become-pass

clean:
	echo ">>> Running clean"
	#For sudo password check terraform.tfvars for ssh_password in terraform folder
	ansible-playbook -i ./inventory.yaml clean-app-deployment-playbook.yaml  --ask-become-pass

uninstall-deps:
	echo ">>> Running uninstall-deps"
	#For sudo password check terraform.tfvars for ssh_password in terraform folder
	ansible-playbook -i ./inventory.yaml uninstall-dependencies-playbook.yaml --ask-become-pass

inventory:
	echo ">>> Running inventory generation"
	# Define inventory from terraform outputs
	rm -rf inventory.yaml
	bash ./generate_inventory.sh

destroy: clean uninstall-deps

.PHONY: all inventory install-deps deploy check clean uninstall-deps destroy
