import boto3
import time
print("Going to list out S3 buckets using python script")
s3=boto3.resource('s3')
for each_buck in s3.buckets.all():
    print each_buck.name
time.sleep(3)
exit()

