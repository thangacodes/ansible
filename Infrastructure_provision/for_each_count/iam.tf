## For_each concepts.

## When to use for_each instead of count. If the resources you are provisioning are identical or nearly identical, then count is a safe bet. However, if elements of the resources change between the different instances, then for_each is the way to go.


# resource "aws_iam_user" "testing" {
#   #   count = length(var.users)
#   #   name  = var.users[count.index]
#   for_each = toset(var.users)
#   name     = each.value
# }

###########################################################

resource "aws_instance" "demo" {
  #   count         = length(var.instance)
  count         = 5
  instance_type = "t2.micro"
  ami           = "012b9156f755804f5"
  tags = {
    Name = var.name[count.index]
  }
}

# resource "aws_instance" "demo" {
#   instance_type = "t2.micro"
#   ami           = "012b9156f755804f5"
#   for_each      = toset(var.instance)
# }
