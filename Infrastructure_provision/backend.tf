terraform {
backend "s3" {
bucket         = "durai-terraform-state-backend"
key            = "terraform.tfstate"
region         = "ap-south-1"
dynamodb_table = "terraform_state"
}
}
