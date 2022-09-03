resource "aws_iam_user" "testing" {
  name  = "SVC-ACCOUNT-${count.index}"
  count = 5
  path  = "/system/"
  tags  = var.tagging
}
