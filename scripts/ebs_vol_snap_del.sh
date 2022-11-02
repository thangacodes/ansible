#!/bin/bash
echo "Deleting EBS Volume snapshot using AWS CLI"
cat snap.txt | sed -n '11p'
cut -d ":" -f 2 snap.txt
aws ec2 delete-snapshot --snapshot-id snap-1234567890abcdef0 --region "ap-south-1"
sleep 30
exit
