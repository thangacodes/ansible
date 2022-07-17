resource "aws_vpc" "dev_vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "Dev-network"
  }
}

resource "aws_subnet" "dev_pub-subnet1" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "192.168.1.0/24"
  tags = {
    Name = "dev_public_subnet1"
  }
}

resource "aws_subnet" "dev_priv-subnet1" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "192.168.2.0/24"
  tags = {
    Name = "dev_private_subnet1"
  }
}

resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.dev_vpc.id
  tags = {
    Name = "Dev-network-igw"
  }
}

resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.dev_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-igw.id
  }
  tags = {
    Name = "Dev-public_rt"
  }
}
resource "aws_route_table_association" "dev_pub_assoc" {
  subnet_id      = aws_subnet.dev_pub-subnet1.id
  route_table_id = aws_route_table.pub-rt.id
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.dev_pub-subnet1.id

  tags = {
    Name = "Dev-Nat-gw"
  }
}
resource "aws_route_table" "priv-rt" {
  vpc_id = aws_vpc.dev_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.example.id
  }
  tags = {
    Name = "Dev-private-rt"
  }
}
resource "aws_route_table_association" "dev_priv_assoc" {
  subnet_id      = aws_subnet.dev_priv-subnet1.id
  route_table_id = aws_route_table.priv-rt.id
}

resource "aws_eip" "example" {
  vpc = var.assoc_public_ip
  tags = {
    Name = "Public IP for NAT G/W"
  }
}
