output "ami_id" {
  value = aws_ami_from_instance.demo.id
}

output "tagging_details" {
  value = aws_ami_from_instance.demo.tags
}
