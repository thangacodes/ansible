variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "another-region" {
  type    = string
  default = "us-east-1"
}

variable "first-cidr" {
  type    = string
  default = "100.0.0.0/16"
}
variable "second-cidr" {
  type    = string
  default = "200.0.0.0/16"
}

variable "firstpub-cidr" {
  type    = string
  default = "100.0.1.0/24"
}

variable "secondpub-cidr" {
  type    = string
  default = "200.0.1.0/24"
}

variable "ami" {
  type        = string
  description = "EC2 instance Base Image name"
  default     = "ami-00c5a35740f4561e7"
}
variable "usami" {
  type        = string
  description = "EC2 instance Base Image name"
  default     = "ami-090fa75af13c156b4"
}
variable "instance_type" {
  type        = string
  description = "EC2 type"
  default     = "t2.micro"
}

variable "key" {
  type        = string
  description = "EC2 instance private key"
  default     = "admin"
}
variable "uskey" {
  type        = string
  description = "EC2 instance private key"
  default     = "USEAST1"
}
