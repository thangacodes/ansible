

Useful ansible Dynamic inventory commands:-

1. Visualize the structure of your dynamic inventory:

ansible-inventory -i ec2.yml --graph

2. Query your dynamic inventory for AWS EC2 instances

ansible-inventory -i amazon.aws.aws_ec2.yml --list

3. This is to run dynamic inventory (ec2.yml) and return the entire inventory in JSON format.

ansible-inventory -i ec2.yml --list | jq '.web_servers'

4. Attempt to "ping" all EC2 instances in the Dynamic inventory.

ansible -i ec2.yml all -m ping

5. To run an Ansible playbook (ping.yml) against the hosts specified in the dynamic inventory

ansible-playbook -i ec2.yml ping.yml


Dynamic Inventory Plugin:

[Ansible EC2 Guide](https://docs.ansible.com/ansible/latest/collections/amazon/aws/docsite/aws_ec2_guide.html)

