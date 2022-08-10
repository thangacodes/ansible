output "anspubip" {
  value = "http://${aws_instance.accm-ansible.public_ip}:80"
}
output "ansprivip" {
  value = "http://${aws_instance.accm-ansible.private_ip}:80"
}
output "keypair" {
  value = "Keypair name is ${aws_key_pair.deployer.id}"
}
