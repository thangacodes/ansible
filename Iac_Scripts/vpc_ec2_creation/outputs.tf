## Fetching the resources details that we provisioned using Terraform

output "PublicIP" {
  value = aws_instance.vm.public_ip
}
output "PrivateIP" {
  value = aws_instance.vm.private_ip
}
output "SGId" {
  value = aws_security_group.dev-sg.id
}

output "SGingress_rule" {
  value = aws_security_group.dev-sg.ingress
}
output "SGegress_rule" {
  value = aws_security_group.dev-sg.egress
}

output "vpccidr" {
  value = aws_vpc.dev.cidr_block
}
output "vpcid" {
  value = aws_vpc.dev.id
}
output "publicsubnet" {
  value = aws_subnet.public.id
}
output "pubsub_cidr" {
  value = aws_subnet.public.cidr_block
}
output "privatesubnet" {
  value = aws_subnet.private.id
}
output "privsub_cidr" {
  value = aws_subnet.private.cidr_block
}
