output "mumbai-vm-pubip" {
  value = aws_instance.virginia-vm.public_ip
}
output "mumbai-vm-privip" {
  value = aws_instance.virginia-vm.private_ip
}

output "virginia-vm-pubip" {
  value = aws_instance.virginia-vm.public_ip
}

output "virginia-vm-privip" {
  value = aws_instance.virginia-vm.private_ip
}
