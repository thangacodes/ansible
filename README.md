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
localhost | CHANGED | rc=0 >>
 rsyslog configuration file

# For more information see /usr/share/doc/rsyslog-*/rsyslog_conf.html
# If you experience problems, see http://www.rsyslog.com/doc/troubleshoot.html

#### MODULES ####

# The imjournal module bellow is now used as a message source instead of imuxsock.
$ModLoad imuxsock # provides support for local system logging (e.g. via logger command)
$ModLoad imjournal # provides access to the systemd journal
#$ModLoad imklog # reads kernel messages (the same are read from journald)
#$ModLoad immark  # provides --MARK-- message capability

# Provides UDP syslog reception
$ModLoad imudp
$UDPServerRun 514

# Provides TCP syslog reception
$ModLoad imtcp
$InputTCPServerRun 514


#### GLOBAL DIRECTIVES ####

# Where to place auxiliary files
$WorkDirectory /var/lib/rsyslog

# Use default timestamp format
$ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat

# File syncing capability is disabled by default. This feature is usually not required,
# not useful and an extreme performance hit
#$ActionFileEnableSync on

# Include all config files in /etc/rsyslog.d/
$IncludeConfig /etc/rsyslog.d/*.conf

# Turn off message reception via local log socket;
# local messages are retrieved through imjournal now.
$OmitLocalLogging on

# File to store the position in the journal
$IMJournalStateFile imjournal.state


#### RULES ####

# Log all kernel messages to the console.
# Logging much else clutters up the screen.
#kern.*                                                 /dev/console

# Log anything (except mail) of level info or higher.
# Don't log private authentication messages!
*.info;mail.none;authpriv.none;cron.none                /var/log/messages

# The authpriv file has restricted access.
authpriv.*                                              /var/log/secure

# Log all the mail messages in one place.
mail.*                                                  -/var/log/maillog


# Log cron stuff
cron.*                                                  /var/log/cron

# Everybody gets emergency messages
*.emerg                                                 :omusrmsg:*

# Save news errors of level crit and higher in a special file.
uucp,news.crit                                          /var/log/spooler

# Save boot messages also to boot.log
local7.*                                                /var/log/boot.log
# ### begin forwarding rule ###
# The statement between the begin ... end define a SINGLE forwarding
# rule. They belong together, do NOT split them. If you create multiple
# forwarding rules, duplicate the whole block!
# Remote Logging (we use TCP for reliable delivery)
#
# An on-disk queue is created for this action. If the remote host is
# down, messages are spooled to disk and sent when it is up again.
#$ActionQueueFileName fwdRule1 # unique name prefix for spool files
#$ActionQueueMaxDiskSpace 1g   # 1gb space limit (use as much as possible)
#$ActionQueueSaveOnShutdown on # save messages to disk on shutdown
#$ActionQueueType LinkedList   # run asynchronously
#$ActionResumeRetryCount -1    # infinite retries if host is down
# remote host is: name/ip:port, e.g. 192.168.0.1:514, port optional
#*.* @@remote-host:514
# ### end of the forwarding rule ###
-------------------------------------------------------------------------------------------------------------------------------------
$ ansible webservers -m ping
172.31.1.69 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    }, 
    "changed": false, 
    "ping": "pong"
}
172.31.9.176 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    }, 
    "changed": false, 
    "ping": "pong"
}
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
-------------------------------------------------------------------------------------------------------






