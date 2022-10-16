resource "aws_vpc" "example" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "Corp-vpc"
  }
}


resource "aws_subnet" "private" {
  for_each   = var.cidrs
  cidr_block = each.value
  vpc_id     = aws_vpc.example.id
  tags = {
    Name = var.tagging
  }
}

resource "aws_internet_gateway" "privigw" {
  vpc_id = aws_vpc.example.id
  tags = {
    Name = "PrivateIGW"
  }
}

resource "aws_route_table" "privart" {
  vpc_id = aws_vpc.example.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.privigw.id
  }
  tags = {
    Name = "private-route-table"
  }
}

locals {
  pvt_sub_ids = toset([for s in aws_subnet.private : s.id])
}

resource "aws_route_table_association" "pvt-assoc" {
  for_each       = local.pvt_sub_ids
  subnet_id      = each.value
  route_table_id = aws_route_table.privart.id
}
