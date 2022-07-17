variable "vpc_cidr" {
  type        = string
  description = "This will be my base network boundary"
  default     = "192.168.0.0/16"
}

variable "public_sub_cidr" {
  type        = string
  description = "This will be my public subnet"
  default     = "192.168.1.0/24"
}

variable "private_sub_cidr" {
  type        = string
  description = "This will be my private subnet"
  default     = "192.168.2.0/24"
}

variable "map_ip" {
  type        = bool
  description = "IP assignment will be True or False"
  default     = true
}

variable "instance" {
  type        = string
  description = "Choosing the instance type"
  default     = "t2.micro"
}

variable "key" {
  type        = string
  description = "private key file"
  default     = "admin"
}

variable "Environment" {
  type        = string
  description = "name of a place, where we are provisioning the resources"
  default     = "dev"
}

variable "az" {
  type        = string
  description = "variable for availability zone"
  default     = "ap-south-1a"
}

variable "zoneid" {
  type        = string
  description = "variable for availability zone Id"
  default     = "aps1-az1"
}
