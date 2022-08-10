### Ansible instance creation
resource "aws_instance" "accm-ansible" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.ansible-sgp.id}"]
  key_name               = aws_key_pair.deployer.id
  subnet_id              = "subnet-e9190a81"
  tags                   = merge(var.all_tags, { Name = "ec2-as-demo-ansible" })
}

### keypair creation
resource "tls_private_key" "key-pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

//For saving the key generated in .pem extension
resource "local_file" "private-key" {
  content         = tls_private_key.key-pair.private_key_pem
  filename        = "${var.ssh_key_name}.pem"
  file_permission = "400"
}

resource "aws_key_pair" "deployer" {
  key_name   = var.ssh_key_name
  public_key = tls_private_key.key-pair.public_key_openssh
  tags       = merge(var.all_tags, { Name = "${var.ssh_key_name}" })
}
