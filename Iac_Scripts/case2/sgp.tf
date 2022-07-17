resource "aws_security_group" "ssh" {
  vpc_id      = aws_vpc.dev_vpc.id
  name = "SSH_SGP"
  description = "allowing ssh ingress rule"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SSH-SGP"
  }
}

resource "aws_security_group" "web" {
  vpc_id      = aws_vpc.dev_vpc.id
  name = "HTTP-SGP"
  description = "allowing http ingress rule"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "HTTP-SGP"
  }
}

resource "aws_security_group" "ssl" {
  vpc_id      = aws_vpc.dev_vpc.id
  name = "SSL-SGP"
  description = "allowing ssl ingress rule"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SSL-SGP"
  }
}
