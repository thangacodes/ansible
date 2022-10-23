resource "aws_ami_from_instance" "demo" {
  name               = "CICD-JENKINS-AMI"
  source_instance_id = var.instance_id
  tags               = var.tagging
}
