resource "aws_internet_gateway" "first-pub-igw" {
  vpc_id = aws_vpc.first.id
  tags = {
    Name = "Bombay-vpc-igw"
  }
}

resource "aws_internet_gateway" "second-pub-igw" {
  vpc_id   = aws_vpc.second.id
  provider = aws.dev
  tags = {
    Name = "Virginia-vpc-igw"
  }
}
