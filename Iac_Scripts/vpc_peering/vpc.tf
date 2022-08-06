resource "aws_vpc" "first" {
  cidr_block = var.first-cidr
  tags = {
    Name  = "Bombay-vpc"
    Owner = "Thangadurai.Murugan@example.com"
  }
}

resource "aws_vpc" "second" {
  cidr_block = var.second-cidr
  provider   = aws.dev
  tags = {
    Name  = "Virginia-vpc"
    Owner = "Thangadurai.Murugan@example.com"
  }
}
