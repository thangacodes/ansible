########### VPC Section #############
resource "aws_vpc" "demo-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name          = "Module_VPC"
    Change_Number = "CHG123450"
    Owner         = "Thangadurai.Murugan@example.com"
  }
}

variable "vpc_cidr" {
  type    = string
  default = "170.0.0.0/16"
}
#### Public subnet creation
resource "aws_subnet" "demo-public" {
  vpc_id                  = aws_vpc.demo-vpc.id
  cidr_block              = "170.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  tags = {
    Name = "public-subnet1"
  }
}

### Internet gateway creation
resource "aws_internet_gateway" "public-igw" {
  vpc_id = aws_vpc.demo-vpc.id
  tags = {
    Name = "my-test-pub-igw"
  }
}

##Public route-table
resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.demo-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public-igw.id
  }

  tags = {
    Name = "my-test-public-route"
  }
}

## Private subnet creation

resource "aws_subnet" "demo-private" {
  vpc_id            = aws_vpc.demo-vpc.id
  cidr_block        = "170.0.2.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "private-subnet1"
  }
}

# Private Route Table
resource "aws_route_table" "demo-private-rt" {
  vpc_id = aws_vpc.demo-vpc.id
  tags = {
    Name        = "my-private-subnet-rt"
    Description = "This RT is associated with Private subnet"
  }
}

### Associate Public subnet with Public Route Table

resource "aws_route_table_association" "public-subnet-association" {
  route_table_id = aws_route_table.public-route.id
  subnet_id      = aws_subnet.demo-public.id
  depends_on     = [aws_route_table.public-route, aws_subnet.demo-public]
}

### Associate Private subnet with Private Route Table

resource "aws_route_table_association" "private-subnet-association" {
  route_table_id = aws_route_table.demo-private-rt.id
  subnet_id      = aws_subnet.demo-private.id
  depends_on     = [aws_route_table.demo-private-rt, aws_subnet.demo-private]
}

###Outputs for vpc
output "vpcid" {
  value = aws_vpc.demo-vpc.id
}
output "vpccidr" {
  value = aws_vpc.demo-vpc.cidr_block
}

output "pubsub" {
  value = aws_subnet.demo-public.cidr_block
}

output "privsub" {
  value = aws_subnet.demo-private.cidr_block
}

############### EC2 section ################
resource "aws_instance" "mod_ec2" {
  instance_type          = "t2.micro"
  ami                    = "ami-06489866022e12a14"
  availability_zone      = "ap-south-1a"
  vpc_security_group_ids = ["${aws_security_group.demo_sg.id}"]
  subnet_id              = aws_subnet.demo-public.id
  key_name               = "TF_key"
  #count                  = 1

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = "tfkey.pem"
  }

  provisioner "file" {
    source      = "./bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }
  tags = {
    Name          = "Jenkins-Server"
    Purpose       = "This is acting as Jenkins"
    Change_Number = "CHG12345"
  }
}

output "instance_id" {
  value = aws_instance.mod_ec2.*.id
}
output "instance_pubips" {
  value = aws_instance.mod_ec2.*.public_ip
}

output "instance_names" {
  value = aws_instance.mod_ec2.*.tags.Name
}
output "instance_privips" {
  value = aws_instance.mod_ec2.*.private_ip
}

## Security Group creation
resource "aws_security_group" "demo_sg" {
  vpc_id = aws_vpc.demo-vpc.id
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
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
    Name        = "module-vpc-sgp"
    Description = "This is associated with module-vpc"
  }
}

########Public/private ssh key creation #############
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "dev" {
  key_name   = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "local_file" "TF-key" {
  content         = tls_private_key.rsa.private_key_pem
  filename        = "tfkey.pem"
  file_permission = "0400"
}

