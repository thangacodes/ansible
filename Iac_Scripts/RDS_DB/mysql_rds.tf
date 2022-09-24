## Create our rds DB using TF
resource "aws_db_instance" "myrds" {
  engine              = "mysql"
  engine_version      = "8.0.27"
  allocated_storage   = 20
  instance_class      = "db.t2.micro"
  storage_type        = "gp2"
  identifier          = "mydb"
  username            = "admin"
  password            = "login1-2"
  publicly_accessible = true
  skip_final_snapshot = true

  tags = {
    Name              = "MySQLDatabase"
    CreationDate      = "24/09/2022"
    Environment       = "Development"
    Contact_Owner     = "Thangadurai.murugan@example.com"
    Terraform_Version = "v1.2.8"
  }
}
