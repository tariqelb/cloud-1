# Ansible automation Makefile

# Color Definitions
GREEN := \033[0;32m
BLUE := \033[0;34m
NC := \033[0m # No Color (reset)


all: inventory install-deps deploy check

install-deps:
	@echo "${GREEN}>>>> Running install-deps${NC}"
	@echo "$(BLUE)For sudo password check terraform.tfvars for ssh_password in terraform folder$(NC)"
	@ansible-playbook -i ./inventory.yaml check-and-install-depemdencies-playbook.yaml  --ask-become-pass

deploy:
	@echo "${GREEN}>>>> Running deploy${NC}"
	@echo "$(BLUE)For sudo password check terraform.tfvars for ssh_password in terraform folder$(NC)"
	@ansible-playbook -i ./inventory.yaml deploy-app-playbook.yaml  --ask-become-pass

check:
	@echo "${GREEN}>>>> Running check${NC}"
	@echo "$(BLUE)For sudo password check terraform.tfvars for ssh_password in terraform folder$(NC)"
	@ansible-playbook -i ./inventory.yaml check-containers-health-playbook.yaml  --ask-become-pass

clean:
	@echo "${GREEN}>>>> Running clean${NC}"
	@echo "$(BLUE)For sudo password check terraform.tfvars for ssh_password in terraform folder$(NC)"
	@ansible-playbook -i ./inventory.yaml clean-app-deployment-playbook.yaml  --ask-become-pass

uninstall-deps:
	@echo ">>> Running uninstall-deps${NC}"
	@echo "$(BLUE)For sudo password check terraform.tfvars for ssh_password in terraform folder$(NC)"
	@ansible-playbook -i ./inventory.yaml uninstall-dependencies-playbook.yaml --ask-become-pass

inventory:
	@echo  "${GREEN}>>> Running inventory generation${NC}"
	@# Define inventory from terraform outputs
	@rm -rf inventory.yaml
	@bash ./generate_inventory.sh

destroy: clean uninstall-deps

.PHONY: all inventory install-deps deploy check clean uninstall-deps destroy
