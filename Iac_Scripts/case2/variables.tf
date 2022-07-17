variable "instance_type" {
  description = "Instance type Specification"
  type        = string
  default     = "t2.micro"
}
variable "assoc_public_ip" {
  description = "Associate public IP address to the EC2 instances"
  type        = bool
  default     = "true"
}
