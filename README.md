This is the page, where you will get to know about the ansible config and playbook for my test automation.

Ansible playbook syntax check command
ansible-playbook rds_prod.yml  --syntax-check
To execute any playbook
ansible-playbook << playbook >>
Ex: ansible-playbook test.yaml
Will be able to execute playbooks in any places in Unix based OS,
ansible-playbook /opt/playbooks/httpd_config.yml

$ ansible-playbook -i inventory /home/ec2-user/dev.yml app-deployer.yml   (if you wanna call multi playbook in adhoc)

$ ansible localhost -m command -a "cat /etc/passwd"

$ ansible localhost -m command -a "cat /etc/rsyslog.conf"

$ ansible webservers -m setup -a "filter=*ipv*"

$ ansible all -m copy -a "src=/home/ansadmin/india.html dest=/home/ansadmin" --check

$ ansible -s all -m yum -a "name=httpd state=latest"  --> When you run this adhoc, where it will throw as " root privilege required"

$ ansible all -a 'uptime'

$ ansible all -a 'uptime' -o

$ ansible localhost -m command -a uptime  (we are using 'command' module)

$ ansible all -b -a 'whoami'    # b- become as 'root' user.

$ ansible all -b -m yum -a "name=httpd state=latest"

$ ansible all -b -m service -a "name=httpd state=started"

$ ansible all -b -m yum -a "name=httpd state=absent"  ("To remove the httpd package")

$ ansible all -b -m reboot

Note" Yum, service, copy, command, ping, reboot are ansible modules.

$ ansible all -b -a 'uptime' -o  (note: wihtout using command module also, we'll be able to get the o/p)

$ ansible localhost -m command -a "free -m"

$ ansible localhost -m shell -a "cat /etc/passwd"

$ ansible localhost -m shell -a "cat /proc/meminfo | head -2"

$ ansible localhost -m shell -a "cat /etc/passwd | grep -i student" -b -K  

### Note: '-b' is the option for become and by default it will become root user
           '–K ' is to tell ansible to ask for SUDO password ( K -is upper case)

$ ansible localhost -m file -a "path=/home/centos/oracle/binaries state=directory mode=0755" -b --become-user=root

$ ansible localhost -m group -a "name=weblogic state=present"

## note: we are creating a user name group named weblogic using the ansible group module.

$ ansible localhost  -m group -a "name=weblogic state=absent"

## note: Deleting the group if you change the 'state to absent'

$ ansible localhost -m user -a "name=weblogic group=weblogic createhome=yes" -b  

## Note: it will create an user name called "weblogic" and it's adding that user to "weblogic" group (which is already exist) and creating home directory for the user.











