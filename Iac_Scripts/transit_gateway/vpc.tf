resource "aws_vpc" "first" {
  cidr_block = var.first_cidr_block
  tags = {
    Name     = "first"
    Location = var.region
  }
}

resource "aws_vpc" "second" {
  cidr_block = var.second_cidr_block
  tags = {
    Name     = "second"
    Location = var.region
  }
}

resource "aws_vpc" "third" {
  cidr_block = var.third_cidr_block
  tags = {
    Name     = "third"
    Location = var.region
  }
}
