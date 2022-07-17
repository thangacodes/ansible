data "aws_ami" "amzon2" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.*"]
  }
}

resource "aws_instance" "apache" {
  ami                         = data.aws_ami.amzon2.id
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.ssh.id, aws_security_group.web.id, aws_security_group.ssl.id]
  subnet_id                   = aws_subnet.dev_pub-subnet1.id
  associate_public_ip_address = var.assoc_public_ip
  key_name                    = aws_key_pair.name.key_name
  connection {
    user        = "ec2-user"
    private_key = tls_private_key.generated.private_key_pem
    host        = self.public_ip
  }
  tags = {
    Name = "Web-Machine"
  }
  provisioner "local-exec" {
    command = "chmod 600 ${local_file.private_key_pem.filename}"
  }
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/script.sh",
      "sudo sh /tmp/script.sh"
    ]
  }
}
