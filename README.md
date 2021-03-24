# ansible-notes

## This is the page, where you will get to know about the ansible config and playbook for my test automation.

## Always keep remember this adhoc commands, whenever you write any playbooks


# If you would like to check the YAML syntax you can use syntax-check
ansible-playbook rds_prod.yml  --syntax-check
# If you would like to execute any playbooks, use following
ansible-playbook httpd_config.yml

# Note: you can execute any playbook, where ever you been presented. Like below an example,
ansible-playbook /opt/playbooks/httpd_config.yml

# My playbook is located under /opt/playbooks/httpd_config.yml. And my present working directory is,
[root@ip-172-31-1-72 ~]# pwd
/root





