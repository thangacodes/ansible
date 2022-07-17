resource "aws_security_group" "websgp" {
  vpc_id      = aws_vpc.my_vpc.id
  description = "Virtual Firewall for web servers"

  ingress {
    description = "http access"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name         = "${local.project}-${var.Environment}-sgp"
    Environment  = var.Environment
    Owner        = "${local.Owner}"
    CreationDate = "${local.CreationDate}"
    avail_zone   = var.az
  }
}
