variable "tagging" {
  type = map(any)
  default = {
    #Name         = "SVC-ACCOUNT-${count.index}"
    Environment  = "DEV"
    CreationDate = "09/03/2022"
    Project      = "TF-IAM-ACCOUNT"
  }
}
