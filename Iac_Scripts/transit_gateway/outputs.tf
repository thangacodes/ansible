output "first-vpc-pubip" {
  value = aws_instance.first-public-ec2.public_ip
}

output "first-vpc-privip" {
  value = aws_instance.first-public-ec2.private_ip
}

output "second-vpc-pubip" {
  value = aws_instance.second-public-ec2.public_ip
}

output "second-vpc-privip" {
  value = aws_instance.second-public-ec2.private_ip
}
