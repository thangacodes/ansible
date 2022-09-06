# Import the AWS module
Import-Module AWSPowerShell.NetCore

#Select the AWS profile deep-dive
Set-AWSCredential -ProfileName "deep-dive"

#Set the default region as applicable
$region = "ap-south-1"
Set-DefaultAWSRegion -Region $region

#Get the VPC and AZs
#This assumes you used grabtech-primary for the name of the VPC
$vpc = Get-EC2Vpc -Filter @{Name="tag:Name"; Values="grabtech-primary"}
$azs = Get-EC2AvailabilityZone
$az = ($azs | Sort-Object -Property ZoneName)[2]

#Create two new subnets in the third AZ
$privateSubnet = New-EC2Subnet -AvailabilityZone $az.ZoneName `
     -CidrBlock "192.168.12.0/24" -VpcId $vpc.VpcId
$publicSubnet = New-EC2Subnet -AvailabilityZone $az.ZoneName `
     -CidrBlock "192.168.2.0/24" -VpcId $vpc.VpcId

#Get the Public route table for all public subnets and associate the new public subnet
$publicRouteTable = Get-EC2RouteTable `
     -Filter @{ Name="tag:Name"; values="grabtech-primary-public"} -Region $region
$publicRouteTableAssociation = Register-EC2RouteTable `
     -RouteTableId $publicRouteTable.RouteTableId -SubnetId $publicSubnet.SubnetId

#Create a route table for the new private subnet and send traffic through the NAT Gateway
$privateRouteTable = New-EC2RouteTable -VpcId $vpc.VpcId
Register-EC2RouteTable -RouteTableId $privateRouteTable.RouteTableId `
     -SubnetId $privateSubnet.SubnetId

Write-Output "Oh john, what did you do?"

$JimmysResources = @{}
$JimmysResources.Add("privateSubnet",$privateSubnet.SubnetId)
$JimmysResources.Add("publicSubnet",$publicSubnet.SubnetId)
$JimmysResources.Add("privateRouteTable",$privateRouteTable.RouteTableId)
$JimmysResources.Add("privateRouteTableAssoc","$($privateSubnet.SubnetId)/$($privateRouteTable.RouteTableId)")
$JimmysResources.Add("publicRouteTableAssoc","$($publicSubnet.SubnetId)/$($publicRouteTable.RouteTableId)")


Write-Output ($JimmysResources.GetEnumerator() | sort -Property Name)

