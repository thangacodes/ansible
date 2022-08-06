provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "dev"
  region = var.another-region
}
