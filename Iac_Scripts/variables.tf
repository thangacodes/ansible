variable "aws_region" {
  type    = string
  default = "ap-south-1"
}
variable "vpc_name" {
  type    = string
  default = "demo_vpc"
}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "private_subnets" {
  default = {
    "private_subnet_1" = 1
    "private_subnet_2" = 2
  }
}
variable "public_subnets" {
  default = {
    "public_subnet_1" = 1
    "public_subnet_2" = 2
  }
}

variable "instance_type" {
  type        = string
  description = "To do practice, it should be always t2"
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "private key for the ec2 instance"
  default     = "admin"
}
