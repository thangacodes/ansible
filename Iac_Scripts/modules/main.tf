provider "aws" {
  region = "ap-south-1"
}

module "key_module" {
  source = "./ec2"
}

output "module_ec2id" {
  value = module.key_module.instance_id
}
output "module_ec2pubip" {
  value = module.key_module.instance_pubips
}

output "module_ec2name" {
  value = module.key_module.instance_names
}
output "module_ec2privip" {
  value = module.key_module.instance_privips
}
