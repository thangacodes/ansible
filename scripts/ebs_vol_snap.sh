#!/bin/bash
echo "AWS CLI will be there to take EBS Volume snapshot"
aws ec2 create-snapshot --volume-id $EBS_VOL_ID --description "This is my root volume snapshot"
exit
