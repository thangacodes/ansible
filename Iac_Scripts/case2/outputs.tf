output "Hello_World" {
  value = "hello world"
}

output "public_endpoint" {
  value = "http://${aws_instance.apache.public_ip}:8080/SampleWebApp/"
}

output "finding_vpc" {
  value = "Your VPC ID is ${aws_vpc.dev_vpc.id}"
}
