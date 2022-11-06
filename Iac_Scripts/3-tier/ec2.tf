
resource "aws_instance" "jenkins" {
  ami                    = "ami-0e6329e222e662a52"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0fb1052b659369aa8"]
  key_name               = "admin"
  tags = {
    Name     = "Jenkins-CI"
    Date     = "06/11/2022"
    Owner    = "Thangadurai.murugan@example.com"
    Function = "Application Engineernig"
  }
}
