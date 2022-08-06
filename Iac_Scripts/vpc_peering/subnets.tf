resource "aws_subnet" "first-pub-subnet" {
  vpc_id                  = aws_vpc.first.id
  cidr_block              = var.firstpub-cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "Bombay-Public-Subnet"
  }
}

resource "aws_subnet" "second-pub-subnet" {
  vpc_id                  = aws_vpc.second.id
  cidr_block              = var.second-cidr
  map_public_ip_on_launch = true
  provider                = aws.dev
  tags = {
    Name = "Virginia-Public-Subnet"
  }
}
