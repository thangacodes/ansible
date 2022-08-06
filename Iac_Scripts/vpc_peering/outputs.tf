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
