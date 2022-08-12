## The region where we are provisioning the resoruces
variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "avail_zone" {
  type    = string
  default = "eu-west-1a"
}

## Common tagging for the resources that we provision on AWS
variable "tagging" {
  type = map(any)
  default = {
    TFVersion    = "1.0.0"
    BusinessUnit = "as"
    Owner        = "Aircentre"
    Environment  = "dev"
    ContactEmail = "cm.saas@cae.com"
    VpcType      = "app"
  }
}

variable "vpc_cidr" {
  type    = string
  default = "192.0.0.0/16"
}

variable "privatecidr" {
  type    = string
  default = "192.0.1.0/24"
}
variable "publiccidr" {
  type    = string
  default = "192.0.2.0/24"
}
variable "public-igw" {
  type    = string
  default = "0.0.0.0/0"
}

variable "ssh_key_name" {
  type    = string
  default = "ireland_dev"
}

variable "ami_id" {
  type    = string
  default = "ami-089950bc622d39ed8"

}

variable "instance_type" {
  description = "Instance type should be selected as 't3.xlarge'(4vPC/16gig Mem)"
  type        = string

  validation {
    condition     = can(regex("^[Tt][3].(large|xlarge|2xlarge)", var.instance_type))
    error_message = "Invalid Instance Type name. You have to choose only - t3.large,t3.xlarge,t3.2xlarge?"
  }
}
