```bash

# The repository contains mostly Ansible-related files and playbooks.
* Ansible notes
* Ansible-adhoc-commands
* Ansible-vault-notes

# How to check if an ansible playbook is right or not?
ansible-playbook playbook_name.yaml --syntax-check
How to run an ansible playbook?
ansible-playbook playbook_name.yaml
To override a playbook variable while running the ansible-playbook?
ansible-playbook playbook_name.yaml -e "variable_name=value"
OR
ansible-playbook playbook_name.yaml -e "hostname=try-xyz.com"


# Infra provisiong and Software Configuration Management Scripts:
* Ansible    - Ansible playbooks
* Kubernetes - Manifest files
* Terraform  - Scripts


