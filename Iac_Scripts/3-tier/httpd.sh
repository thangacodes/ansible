#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
echo "Hello, World from grabtech space at $(hostname -f)" > /var/www/html/index.html
sudo systemctl enable httpd
sudo systemctl start httpd
sudo amazon-linux-extras install epel -y
#sudo yum install -y stress
