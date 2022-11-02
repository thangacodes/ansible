#!/bin/bash
echo "AWS CLI will be there to take EBS Volume snapshot"
aws ec2 create-snapshot --volume-id $EBS_VOL_ID --description "This is my root volume snapshot" --region "ap-south-1"
sleep 30
aws ec2 describe-snapshots --owner-ids self  --query 'Snapshots[]' --region=ap-south-1 > snap.txt
cat snap.txt | grep -i 'snap-i'
cut -d ":" -f 2 snap.txt
exit
