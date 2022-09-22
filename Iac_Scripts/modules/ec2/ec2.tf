resource "aws_instance" "mod_ec2" {
  instance_type          = "t2.micro"
  ami                    = "ami-06489866022e12a14"
  vpc_security_group_ids = ["sg-0fb1052b659369aa8"]
  key_name               = var.key_name
  count                  = 2
  tags = {
    Name          = "Name from EC2-Module ${count.index}"
    Purpose       = "This is acting as Appserver ${count.index}"
    Change_Number = "CHG12345${count.index}"
  }
}

variable "key_name" {
  type    = string
  default = "admin"
}

resource "aws_vpc" "demo-vpc" {
  cidr_block = var.vpc_cidr
  count      = 1
  tags = {
    Name          = "Module_VPC${count.index}"
    Change_Number = "CHG12345${count.index}"
    Owner         = "Thangadurai.Murugan@example.com"
  }
}

variable "vpc_cidr" {
  type    = string
  default = "170.0.0.0/16"
}

output "instance_id" {
  value = aws_instance.mod_ec2.*.id
}
output "instance_pubips" {
  value = aws_instance.mod_ec2.*.public_ip
}

output "instance_names" {
  value = aws_instance.mod_ec2.*.tags.Name
}
output "instance_privips" {
  value = aws_instance.mod_ec2.*.private_ip
}
