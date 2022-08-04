resource "aws_security_group" "first-sg" {
  name        = "Allow-all-ports-SGP"
  description = "Allowing all ports on inbound rule"
  vpc_id      = aws_vpc.first.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
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
    Name = "first-vpc-sgp"
    VPC  = aws_vpc.first.id
  }
}

resource "aws_security_group" "second-sg" {
  name        = "All-ports-SGP"
  description = "Allowing all ports on inbound rule"
  vpc_id      = aws_vpc.second.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
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
    Name = "second-vpc-sgp"
    VPC  = aws_vpc.second.id
  }
}

resource "aws_instance" "first-public-ec2" {
  ami                    = "ami-090fa75af13c156b4"
  instance_type          = "t2.micro"
  key_name               = "USEAST1"
  vpc_security_group_ids = ["${aws_security_group.first-sg.id}"]
  subnet_id              = aws_subnet.public.id
  tags = {
    Name = "first-vpc-ec2-instance"
    VPC  = aws_vpc.first.id
  }
}

resource "aws_instance" "second-public-ec2" {
  ami                    = "ami-090fa75af13c156b4"
  instance_type          = "t2.micro"
  key_name               = "USEAST1"
  vpc_security_group_ids = ["${aws_security_group.second-sg.id}"]
  subnet_id              = aws_subnet.second-public-subnet.id
  tags = {
    Name = "second-vpc-ec2-instance"
    VPC  = aws_vpc.first.id
  }
}
