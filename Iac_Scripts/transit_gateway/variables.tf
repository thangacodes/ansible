variable "region" {
  default = "us-east-1"
}

variable "first_cidr_block" {
  type        = string
  description = "This is my first vpc"
  default     = "10.0.0.0/16"
}

variable "second_cidr_block" {
  type        = string
  description = "This is my first vpc"
  default     = "20.0.0.0/16"
}

variable "third_cidr_block" {
  type        = string
  description = "This is my first vpc"
  default     = "30.0.0.0/16"
}

variable "first_public_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "second_public_cidr" {
  type    = string
  default = "20.0.1.0/24"
}

variable "third_public_cidr" {
  type    = string
  default = "30.0.1.0/24"
}
