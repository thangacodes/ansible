variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "instance_id" {
  type = string
}

variable "tagging" {
  type = map(string)
  default = {
    Name         = "CICD-JENKINS-TF-AMI"
    Owner        = "Thangadurai.Murugan"
    CreationDate = "23-10-2022"
    Email        = "thangadurai.murugan@example.com"
  }
}
