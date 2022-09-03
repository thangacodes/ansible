output "iam_users_arn" {
  value = aws_iam_user.testing[*].arn
}
output "iam_users_name" {
  value = aws_iam_user.testing[*].name
}
output "iam_users_id" {
  value = aws_iam_user.testing[*].id
}
output "iam_users_tag" {
  value = aws_iam_user.testing[*].tags
}
output "iam_users_path" {
  value = aws_iam_user.testing[*].path
}
