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

output "module_vpcid" {
  value = module.key_module.vpcid
}

output "module_vpccidr" {
  value = module.key_module.vpccidr
}

output "module_pubsubcidr" {
  value = module.key_module.pubsub
}

output "module_privsubcidr" {
  value = module.key_module.privsub
}
