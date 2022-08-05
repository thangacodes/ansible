resource "aws_vpc" "mumbai-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name  = "Mumbai-vpc"
    Owner = "Thangadurai.Murugan@example.com"
  }
}

resource "aws_vpc" "useast-vpc" {
  cidr_block = "20.0.0.0/16"
  provider   = aws.prod
  tags = {
    Name  = "Northvirgina-vpc"
    Owner = "Thangadurai.Murugan@example.com"
  }
}
