variable "region" {
  default = "ap-south-1"
}
variable "subnet_count" {
  default = 2
}
variable "cidr_block" {
  default = "192.168.0.0/16"
}
variable "private_subnets" {
  type = list(any)
}
variable "public_subnets" {
  type = list(any)
}
