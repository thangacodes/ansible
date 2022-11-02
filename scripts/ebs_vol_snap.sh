#!/bin/bash
echo "AWS CLI will be there to take EBS Volume snapshot"
aws ec2 create-snapshot --volume-id vol-1234567890abcdef0 --description "This is my root volume snapshot" --region "ap-south-1"
exit
