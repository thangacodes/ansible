# Outputs getting 
output "web_pubip" {
  value = aws_instance.web.public_ip
}

output "web_pvtip" {
  value = aws_instance.web.private_ip
}

output "web_pvtdns" {
  value = aws_instance.web.private_dns
}

output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}
output "sgp_id" {
  value = aws_security_group.web_fw.id
}
