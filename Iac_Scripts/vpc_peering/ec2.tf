resource "aws_instance" "first-vm" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key
  vpc_security_group_ids = ["${aws_security_group.first-sgp.id}"]
  subnet_id              = aws_subnet.first-pub-subnet.id
  tags = {
    Name = "Bombay-VM"
  }
}

resource "aws_instance" "second-vm" {
  ami                    = var.usami
  instance_type          = var.instance_type
  key_name               = var.uskey
  vpc_security_group_ids = ["${aws_security_group.second-sgp.id}"]
  subnet_id              = aws_subnet.second-pub-subnet.id
  provider               = aws.dev
  tags = {
    Name = "Virginia-VM"
  }
}
