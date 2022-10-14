resource "aws_dynamodb_table" "terraform-lock" {
    name           = "terraform_state"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        Name = "DynamoDB Terraform State Lock Table"
		CreationDate = "14/10/2022"
		Owner ="thangadurai.murugan@example.com"
    }
}
