resource "aws_subnet" "mumbai-private" {
  vpc_id                  = aws_vpc.mumbai-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name     = "Mumbai-PrivateSubnet"
    Location = var.region
  }
}

resource "aws_internet_gateway" "mumbai-vpc-igw" {
  vpc_id = aws_vpc.mumbai-vpc.id
  tags = {
    Name     = "Mumbai-vpc-igw"
    Location = var.region
  }
}

resource "aws_route_table" "mumbai-priv-rt" {
  vpc_id = aws_vpc.mumbai-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mumbai-vpc-igw.id
  }
}

resource "aws_route_table_association" "mumbai-private-sub-association" {
  subnet_id      = aws_subnet.mumbai-private.id
  route_table_id = aws_route_table.mumbai-priv-rt.id
}

resource "aws_subnet" "virginia-private" {
  vpc_id                  = aws_vpc.useast-vpc.id
  cidr_block              = "20.0.1.0/24"
  map_public_ip_on_launch = true
  provider                = aws.prod
  tags = {
    Name     = "Virginia-PrivateSubnet"
    Location = "US-EAST-1"
  }
}

resource "aws_internet_gateway" "virginia-vpc-igw" {
  vpc_id   = aws_vpc.useast-vpc.id
  provider = aws.prod
  tags = {
    Name     = "virginia-vpc-igw"
    Location = "US-EAST-1"
  }
}

resource "aws_route_table_association" "virginia-private-sub-association" {
  subnet_id      = aws_subnet.virginia-private.id
  route_table_id = aws_route_table.virginia-priv-rt.id
  provider       = aws.prod
}

resource "aws_route_table" "virginia-priv-rt" {
  vpc_id   = aws_vpc.useast-vpc.id
  provider = aws.prod
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.virginia-vpc-igw.id
  }
}
