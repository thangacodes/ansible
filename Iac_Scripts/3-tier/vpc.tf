
## This file contains following resoruces provisioning code in terraform language (HCL)
#aws_vpc
#aws_igw
#aws_route_table
#aws_route
#aws_main_route_table_association -public/private
#aws_subnet -->public/private
#aws_security_group
#aws_lb
#aws_alb_listener

# AWS_VPC_CREATION:
resource "aws_vpc" "my_boundary" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name        = "MY_NETWORK"
    CreatedDate = "06/11/2022"
    Owner       = "Thangadurai.murugan@example.com"
    Function    = "App_Engineering Ops"
    TF_version  = "v1.2.8"
  }
}

## Internet Gateway Creation
resource "aws_internet_gateway" "outside_traffic" {
  vpc_id = aws_vpc.my_boundary.id
  tags = {
    Name        = "MY_IGW"
    CreatedDate = "06/11/2022"
    Owner       = "Thangadurai.murugan@example.com"
    Function    = "App_Engineering Ops"
    TF_version  = "v1.2.8"
  }
}

## Elastic IP Creation:
resource "aws_eip" "fornatip" {
  tags = {
    Name        = "Elastic IP for associating with NAT G/W"
    CreatedDate = "06/11/2022"
    Owner       = "Thangadurai.murugan@example.com"
    Function    = "App_Engineering Ops"
    TF_version  = "v1.2.8"
  }
}

# Nat Gateway Creation
resource "aws_nat_gateway" "pvtnat" {
  allocation_id = aws_eip.fornatip.id
  subnet_id     = aws_subnet.pub.id
  tags = {
    Name        = "NAT gateway for private subnets"
    CreatedDate = "06/11/2022"
    Owner       = "Thangadurai.murugan@example.com"
    Function    = "App_Engineering Ops"
    TF_version  = "v1.2.8"
  }
}

## AWS Subnets (Private/public)
resource "aws_subnet" "pub" {
  vpc_id                  = aws_vpc.my_boundary.id
  cidr_block              = var.pub_sub_cidr
  map_public_ip_on_launch = true
  tags = {
    Name        = "my_app_pubic_subnet1"
    CreatedDate = "06/11/2022"
    Owner       = "Thangadurai.murugan@example.com"
    Function    = "App_Engineering Ops"
    TF_version  = "v1.2.8"
  }
}

resource "aws_subnet" "priv" {
  vpc_id     = aws_vpc.my_boundary.id
  cidr_block = var.pvt_sub_cidr
  tags = {
    Name        = "my_app_private_subnet1"
    CreatedDate = "06/11/2022"
    Owner       = "Thangadurai.murugan@example.com"
    Function    = "App_Engineering Ops"
    TF_version  = "v1.2.8"
  }
}
## AWS_route_table
resource "aws_route_table" "pubrt" {
  vpc_id = aws_vpc.my_boundary.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.outside_traffic.id
  }
  tags = {
    Name        = "Public_rt"
    CreatedDate = "06/11/2022"
    Owner       = "Thangadurai.murugan@example.com"
    Function    = "App_Engineering Ops"
    TF_version  = "v1.2.8"
  }
}

resource "aws_route_table" "pvtrt" {
  vpc_id = aws_vpc.my_boundary.id

  route {
    cidr_block = "192.168.2.0/24"
    gateway_id = aws_nat_gateway.pvtnat.id
  }
  tags = {
    Name        = "Private_rt"
    CreatedDate = "06/11/2022"
    Owner       = "Thangadurai.murugan@example.com"
    Function    = "App_Engineering Ops"
    TF_version  = "v1.2.8"
  }
}

### Subnets association to the respective route tables
resource "aws_route_table_association" "pubsub-assoc" {
  subnet_id      = aws_subnet.pub.id
  route_table_id = aws_route_table.pubrt.id
}

resource "aws_route_table_association" "pvtsub-assoc" {
  subnet_id      = aws_subnet.priv.id
  route_table_id = aws_route_table.pvtrt.id
}

