#!/bin/bash
echo "Deleting EBS Volume snapshot using AWS CLI"
cat snap.txt | sed -n '11p'
cut -d ":" -f 2 snap.txt
cut -d ":" -f 2 snap.txt | grep 'snap-0'
cut -d ":" -f 2 snap.txt | grep 'snap-0' > snapid
cat snapid
echo $(cat snapid)
echo $(cat snapid) | sed -e 's/"//g' > id
sleep 5
aws ec2 delete-snapshot --snapshot-id $(cat id) --region=ap-south-1
sleep 15
exit
