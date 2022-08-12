## VPC -Virtual Network defining
resource "aws_vpc" "dev" {
  cidr_block = var.vpc_cidr
  tags       = merge(var.tagging, { Name = "accm-dev-app-vpc" })
}

## Creation of Public/Private subnets
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = var.privatecidr
  tags       = merge(var.tagging, { Name = "accm-dev-app-private-a" })
}
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = var.publiccidr
  availability_zone       = var.avail_zone
  map_public_ip_on_launch = true
  tags                    = merge(var.tagging, { Name = "accm-dev-app-public-a" })
}

resource "aws_internet_gateway" "pub-igw" {
  vpc_id = aws_vpc.dev.id
  tags   = merge(var.tagging, { Name = "accm-dev-app-igw" })
}

resource "aws_route_table" "app-pub-rt" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = var.public-igw
    gateway_id = aws_internet_gateway.pub-igw.id
  }
  tags = merge(var.tagging, { Name = "accm-dev-app-public-RT" })
}

resource "aws_route_table_association" "dev-pub-association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.app-pub-rt.id
}

resource "aws_route_table" "app-priv-rt" {
  vpc_id = aws_vpc.dev.id
  tags   = merge(var.tagging, { Name = "accm-dev-app-private-RT" })
}


resource "aws_route_table_association" "dev-priv-association" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.app-priv-rt.id
}

## Security group provision with dynamically port allowing on inbound/outbound rules

locals {
  ingress_rules = [{
    port        = 22
    description = "Ingress rules for SSH"
    },
    {
      port        = 80
      description = "Ingress rules for http"
    },
    {
      port        = 443
      description = "Ingress rules for https"
  }]
}

resource "aws_security_group" "dev-sg" {
  name   = "allowing SSH/HTTP/HTTPS"
  vpc_id = aws_vpc.dev.id

  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.tagging, { Name = "accm-allow-all-ports" })
}

### keypair creation
resource "tls_private_key" "key-pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

## For saving the key generated in .pem extension
resource "local_file" "private-key" {
  content         = tls_private_key.key-pair.private_key_pem
  filename        = "${var.ssh_key_name}.pem"
  file_permission = "400"
}

resource "aws_key_pair" "dev" {
  key_name   = var.ssh_key_name
  public_key = tls_private_key.key-pair.public_key_openssh
}

### EBS volume creating and attaching to the EC2 instance
resource "aws_ebs_volume" "ansible-volume" {
  availability_zone = var.avail_zone
  size              = 10
  tags              = merge(var.tagging, { Name = "ansible-vm-volume" })
}

resource "aws_volume_attachment" "ansvol_attachment" {
  device_name = "/dev/sdm"
  volume_id   = aws_ebs_volume.ansible-volume.id
  instance_id = aws_instance.vm.id
}

### EC2 instance creation
resource "aws_instance" "vm" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.dev-sg.id]
  availability_zone           = var.avail_zone
  key_name                    = aws_key_pair.dev.id
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  tags                        = merge(var.tagging, { Name = "ec2-as-accm-ansible-server" })
}


