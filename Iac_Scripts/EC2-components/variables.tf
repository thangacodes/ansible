variable "region" {
  type    = string
  default = "ap-south-1"
}
variable "ami_id" {
  type    = string    //optional
  default = "ami-076e3a557efe1aa9c" 
}
variable "instance_type" {
  type    = string    //optional
  default = "t2.micro"
}

variable "ssh_key_name" {
  default = "dev-key"
}
variable "all_tags" {
  type = map(any)
  default = {
    Owner        = "demo@example.com"
    Environment  = "dev"
    BusinessUnit = "DevOps Division"
    ContactEmail = "demo@example.com"
    UsedBy       = "Operations"
  }
}
