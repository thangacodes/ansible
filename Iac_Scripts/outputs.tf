output "web_pubip" {
  value = aws_instance.web.public_ip
}
output "web_privip" {
  value = aws_instance.web.private_ip
}
