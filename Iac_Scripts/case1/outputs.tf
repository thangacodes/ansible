output "web_pubip" {
  value = "https://${aws_instance.web.public_ip}:8080/SampleWebApp/"
}
output "web_privip" {
  value = "https://${aws_instance.web.private_ip}:8080/SampleWebApp/"
}
/*
output "user_id" {
  value = aws_iam_user.assume_role_user.id
}
output "user_arn" {
  value = aws_iam_user.assume_role_user.arn
}

output "secret_key" {
  value     = aws_iam_access_key.user.secret
  sensitive = true
}

output "access_key" {
  value = aws_iam_access_key.user.id
}
*/

output "vpc_id" {
  value = "your ${local.project}-${var.Environment}-vpc_id is ${aws_vpc.my_vpc.id}"
}
