#!/bin/bash -x
echo "The script is executed at:" $(date)
sudo yum update -y
sudo yum install -y python-boto python-boto3
sudo amazon-linux-extras install ansible2
ansible --version
sudo yum install -y epel-release
exit
