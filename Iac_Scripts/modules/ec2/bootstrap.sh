#!/bin/bash -x
echo "This is the bootstrap script to install require software during the instance provisioning by Terraform"
echo "The script is execute at:" $(date)
sleep 2
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key

# yum upgrade
sudo yum upgrade -y
# Add required dependencies for the jenkins package
sudo amazon-linux-extras install java-openjdk11 -y
sudo amazon-linux-extras install epel -y
sudo yum install jenkins -y
# Start Jenkins
# You can enable the Jenkins service to start at boot with the command:

sudo systemctl enable jenkins
# You can start the Jenkins service with the command:
sudo systemctl start jenkins
#You can check the status of the Jenkins service using the command:
sudo systemctl status jenkins

# Getting the secret from /var/lib/jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword >> /tmp/initialpwd_for_jenkins.txt  
exit
