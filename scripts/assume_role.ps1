##########################################################################
# Script_Name: AWS Assume_Role PowerShell Script                         #
# Author: Thangadurai Murugan                                            #
# Date: 7/16/2022                                                        #
# Contact: send2durai@hotmail.com                                        #
##########################################################################


Write-Host "Small powerShell script" -ForegroundColor Red -BackgroundColor Black
$access_key = Read-Host "Please enter the access_key"
$access_key
$secret_key = Read-Host "Please enter the secret_key"
$secret_key

Set-AWSCredential -AccessKey $access_key -SecretKey $secret_key
Get-S3Bucket
$rolearn = Read-Host "Please enter the role that you've created for assume_role"
$rolesessionname = Read-Host "Please enter any name as you like to provide"
$creds = (Use-STSRole -RoleArn $rolearn -RoleSessionName $rolesessionname).Credentials
$creds.AccessKeyId
$creds.SecretAccessKey
$creds.SessionToken
date
$creds = (Use-STSRole -RoleArn $rolearn -RoleSessionName $rolesessionname -DurationInSeconds 900).Credentials
$creds.AccessKeyId
$creds.SecretAccessKey
$creds.SessionToken
date 
Get-S3Bucket
exit
