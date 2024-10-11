resource "aws_instance" "tooling_nexus" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.tooling_nexus_sg.name]
  tags = {
    Name = "tooling-nexus.${var.environment}"
  }

}

