variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "pub_sub_cidr" {
  type    = string
  default = "192.168.1.0/24"
}
variable "pvt_sub_cidr" {
  type    = string
  default = "192.168.2.0/24"
}
