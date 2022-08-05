resource "aws_instance" "mumbai-vm" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.mumbai-vpc.id}"]
  key_name               = "admin"
  subnet_id              = aws_subnet.mumbai-private.id
  tags = {
    Name     = "MUMBAI-VPC-VM"
    Location = var.region
  }
}

resource "aws_instance" "virginia-vm" {
  ami                    = "ami-090fa75af13c156b4"
  instance_type          = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.virginia-vpc.id}"]
  key_name               = "USEAST1"
  subnet_id              = aws_subnet.virginia-private.id
  provider               = aws.prod
  tags = {
    Name     = "VIRGINIA-VPC-VM"
    Location = "US-EAST-1"
  }
}
