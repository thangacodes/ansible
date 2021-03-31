# ansible-notes

## This is the page, where you will get to know about the ansible config and playbook for my test automation.

## Always keep remember this adhoc commands, whenever you write any playbooks

# If you would like to check the YAML syntax you can use syntax-check
ansible-playbook rds_prod.yml  --syntax-check
# If you would like to execute any playbooks, use following
ansible-playbook httpd_config.yml

# Note: you can execute any playbook, where ever you been presented. Like below an example,
ansible-playbook /opt/playbooks/httpd_config.yml

# Also, Ansible is providing us a 'command' module to execute a single line commands in ansible. Example below,
$ ansible localhost -m command -a "cat /etc/passwd"
$ ansible localhost -m command -a "cat /etc/rsyslog.conf"
$ ansible webservers -m setup -a "filter=*ipv*"
$ ansible all -m copy -a "src=/home/ansadmin/india.html dest=/home/ansadmin" --check
$ ansible -s all -m yum -a "name=httpd state=latest"  --> When you run this adhoc, where it will throw as " root privilege required"
$ ansible all -a 'uptime'
$ ansible all -a 'uptime' -o
$ ansible all -b -a 'whoami'    # b- become as 'root' user.
$ ansible all -b -m yum -a "name=httpd state=latest"
$ ansible all -b -m service -a "name=httpd state=started"
$ ansible all -b -m yum -a "name=httpd state=absent"  ("To remove the httpd package")
$ ansible all -b -m reboot

Note" Yum, service, copy, command, ping, reboot are ansible modules.





