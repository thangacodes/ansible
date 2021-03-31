# ansible-notes

## This is the page, where you will get to know about the ansible config and playbook for my test automation.

## Always keep remember this adhoc commands, whenever you write any playbooks


# If you would like to check the YAML syntax you can use syntax-check
ansible-playbook rds_prod.yml  --syntax-check
# If you would like to execute any playbooks, use following
ansible-playbook httpd_config.yml

# Note: you can execute any playbook, where ever you been presented. Like below an example,
ansible-playbook /opt/playbooks/httpd_config.yml

# My playbook is located under /opt/playbooks/httpd_config.yml

# Also, Ansible is providing us a 'command' module to execute a single line commands in ansible. Example below,
$ ansible localhost -m command -a "cat /etc/passwd"
ansible localhost -m command -a "cat /etc/passwd"
-------------------------------------------------------------------------------------------------------------------------------
$ ansible localhost -m command -a "cat /etc/rsyslog.conf"

----------------------------------------------------------------------------------------------------------------------
[ansadmin@ip-172-31-38-250 home]$ ansible webservers -m setup -a "filter=*ipv*"
172.31.1.69 | SUCCESS => {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "172.31.1.69"
        ], 
        "ansible_all_ipv6_addresses": [
            "fe80::83c:c2ff:feb8:23c4"
        ], 
        "ansible_default_ipv4": {
            "address": "172.31.1.69", 
            "alias": "eth0", 
            "broadcast": "172.31.15.255", 
            "gateway": "172.31.0.1", 
            "interface": "eth0", 
            "macaddress": "0a:3c:c2:b8:23:c4", 
            "mtu": 9001, 
            "netmask": "255.255.240.0", 
            "network": "172.31.0.0", 
            "type": "ether"
        }, 
        "ansible_default_ipv6": {}, 
        "discovered_interpreter_python": "/usr/bin/python"
    }, 
    "changed": false
}
172.31.9.176 | SUCCESS => {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "172.31.9.176"
        ], 
        "ansible_all_ipv6_addresses": [
            "fe80::85a:94ff:fe45:3a98"
        ], 
        "ansible_default_ipv4": {
            "address": "172.31.9.176", 
            "alias": "eth0", 
            "broadcast": "172.31.15.255", 
            "gateway": "172.31.0.1", 
            "interface": "eth0", 
            "macaddress": "0a:5a:94:45:3a:98", 
            "mtu": 9001, 
            "netmask": "255.255.240.0", 
            "network": "172.31.0.0", 
            "type": "ether"
        }, 
        "ansible_default_ipv6": {}, 
        "discovered_interpreter_python": "/usr/bin/python"
    }, 
    "changed": false
}
[ansadmin@ip-172-31-38-250 home]$ 







