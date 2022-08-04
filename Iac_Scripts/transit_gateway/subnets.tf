resource "aws_subnet" "public" {
  cidr_block              = var.first_public_cidr
  vpc_id                  = aws_vpc.first.id
  map_public_ip_on_launch = true
  tags = {
    Name = "first-vpc-pubsubnet"
  }
}

resource "aws_internet_gateway" "first-public-igw" {
  vpc_id = aws_vpc.first.id
  tags = {
    Name = "first-vpc-public-igw"
  }
}

resource "aws_route_table" "first-public-rt" {
  vpc_id = aws_vpc.first.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.first-public-igw.id
  }
  tags = {
    Name = "first-vpc-rt"
  }
}
resource "aws_route_table_association" "first-public-subnet-association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.first-public-rt.id
}

resource "aws_subnet" "second-public-subnet" {
  cidr_block              = var.second_cidr_block
  vpc_id                  = aws_vpc.second.id
  map_public_ip_on_launch = true
  tags = {
    Name = "second-vpc-pubsubnet"
  }
}

resource "aws_internet_gateway" "second-public-igw" {
  vpc_id = aws_vpc.second.id
  tags = {
    Name = "second-vpc-public-igw"
  }
}

resource "aws_route_table" "second-public-rt" {
  vpc_id = aws_vpc.second.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.second-public-igw.id
  }
  tags = {
    Name = "second-vpc-rt"
  }
}
resource "aws_route_table_association" "second-public-subnet-association" {
  subnet_id      = aws_subnet.second-public-subnet.id
  route_table_id = aws_route_table.second-public-rt.id
}

resource "aws_subnet" "third-public-subnet" {
  cidr_block              = var.third_cidr_block
  vpc_id                  = aws_vpc.third.id
  map_public_ip_on_launch = true
  tags = {
    Name = "third-vpc-pubsubnet"
  }
}

resource "aws_internet_gateway" "third-public-igw" {
  vpc_id = aws_vpc.third.id
  tags = {
    Name = "third-vpc-public-igw"
  }
}

resource "aws_route_table" "third-public-rt" {
  vpc_id = aws_vpc.third.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.third-public-igw.id
  }
  tags = {
    Name = "third-vpc-rt"
  }
}

resource "aws_route_table_association" "third-public-subnet-association" {
  subnet_id      = aws_subnet.third-public-subnet.id
  route_table_id = aws_route_table.third-public-rt.id
}
