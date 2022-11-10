resource "aws_iam_user" "testing" {
  name  = "SVC-ACCOUNT-${count.index}"
  count = 10
  path  = "/system/"
  tags  = var.tagging
}
