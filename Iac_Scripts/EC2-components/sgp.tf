resource "aws_security_group" "ansible-sgp" {
  description = "Create security group for Ansible"
  ingress {
    description = "Allowing only from public ssh port"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.all_tags, { Name = "sg-as-accm-ansible-SGP" })
}
