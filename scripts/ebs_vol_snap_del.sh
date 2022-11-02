#!/bin/bash
echo "Deleting EBS Volume snapshot using AWS CLI"
cat snap.txt | sed -n '11p'
cut -d ":" -f 2 snap.txt
cut -d ":" -f 2 snap.txt | grep 'snap-0'
cut -d ":" -f 2 snap.txt | grep 'snap-0' > snapid
cat snapid
echo $(cat snapid)
sleep 5
aws ec2 delete-snapshot --snapshot-id $(cat snapid) --region=ap-south-1
sleep 20
exit
