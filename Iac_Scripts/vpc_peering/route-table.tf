resource "aws_route_table_association" "first-pubsub-association" {
  subnet_id      = aws_subnet.first-pub-subnet.id
  route_table_id = aws_route_table.first-pub-rt.id
}

resource "aws_route_table_association" "second-pubsub-association" {
  subnet_id      = aws_subnet.second-pub-subnet.id
  route_table_id = aws_route_table.second-pub-rt.id
  provider       = aws.dev
}
resource "aws_route_table" "first-pub-rt" {
  vpc_id = aws_vpc.first.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.first-pub-igw.id
  }
  tags = {
    Name = "first-public-rt-mumbai"
  }
}

resource "aws_route_table" "second-pub-rt" {
  vpc_id   = aws_vpc.second.id
  provider = aws.dev
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.second-pub-igw.id
  }
  tags = {
    Name = "second-public-rt-virginia"
  }
}
