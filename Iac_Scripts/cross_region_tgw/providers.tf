provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "prod"
  region = "us-east-1"
}
