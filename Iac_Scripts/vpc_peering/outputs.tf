output "first-vm-pubip" {
  value = aws_instance.first-vm.public_ip
}
output "first-vm-privip" {
  value = aws_instance.first-vm.private_ip
}
output "second-vm-pubip" {
  value = aws_instance.second-vm.public_ip
}
output "second-vm-privip" {
  value = aws_instance.second-vm.private_ip
}
output "mumbai-vpcrange" {
  value = aws_vpc.first.cidr_block
}
output "virginia-vpcrange" {
  value = aws_vpc.second.cidr_block
}
output "mumbai-pubcidr" {
  value = aws_subnet.first-pub-subnet.cidr_block
}
output "virginia-pubcidr" {
  value = aws_subnet.second-pub-subnet.cidr_block
}
output "mumigw" {
  value = aws_internet_gateway.first-pub-igw.id
}
output "virginiaigw" {
  value = aws_internet_gateway.second-pub-igw.id
}
output "mum-sgp" {
  value = aws_security_group.first-sgp.ingress
}
output "virginia-sgp" {
  value = aws_security_group.second-sgp.ingress
}
output "mum-pubrt-routes" {
  value = aws_route_table.first-pub-rt.route
}
output "virginia-pubrt-routes" {
  value = aws_route_table.second-pub-rt.route
}
