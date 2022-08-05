resource "aws_security_group" "mumbai-vpc" {
  description = "Allowing port 22,443,80"
  vpc_id      = aws_vpc.mumbai-vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Mumbai-sgp"
  }
}

resource "aws_security_group" "virginia-vpc" {
  description = "Allowing port 22,443,80"
  vpc_id      = aws_vpc.useast-vpc.id
  provider    = aws.prod
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Virginia-sgp"
  }
}
