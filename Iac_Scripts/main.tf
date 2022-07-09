locals {
  project      = "lab"
  CreationDate = "07/07/2022"
  Owner        = "thangadurai.murugan"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name         = "${local.project}-${var.Environment}-network"
    Environment  = var.Environment
    CreationDate = "${local.CreationDate}"
    Owner        = "${local.Owner}"
    Terraform    = "True"
    avail_zone   = var.az
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_sub_cidr
  availability_zone_id    = var.zoneid
  map_public_ip_on_launch = var.map_ip
  tags = {
    Name         = "${local.project}-${var.Environment}-public-subnet1"
    Environment  = var.Environment
    CreationDate = "${local.CreationDate}"
    Terraform    = "True"
    Owner        = "${local.Owner}"
    avail_zone   = var.az
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id               = aws_vpc.my_vpc.id
  cidr_block           = var.private_sub_cidr
  availability_zone_id = var.zoneid
  tags = {
    Name         = "${local.project}-${var.Environment}-private-subnet1"
    Environment  = var.Environment
    CreationDate = "${local.CreationDate}"
    Terraform    = "True"
    Owner        = "${local.Owner}"
  }
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.web.id
  instance_type          = var.instance
  key_name               = var.key
  subnet_id              = aws_subnet.public_subnet1.id
  vpc_security_group_ids = [aws_security_group.websgp.id]
  user_data              = file("userdata.sh")
  tags = {
    Name         = "${local.project}-${var.Environment}-server"
    Environment  = var.Environment
    Owner        = "${local.Owner}"
    CreationDate = "${local.CreationDate}"
    avail_zone   = var.az
  }
}

resource "aws_s3_bucket" "app-bucket" {
  bucket = "${local.project}-${var.Environment}-murugan-bucket"
}

