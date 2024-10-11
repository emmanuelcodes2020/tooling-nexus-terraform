resource "aws_security_group" "tooling_nexus_sg" {
  name        = var.vpc_security_group_ids
  description = "sg to allow access to app"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "ingress_ssh_rule" {
  type              = "ingress"
  description       = "ssh access"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tooling_nexus_sg.id
}


resource "aws_security_group_rule" "egress_ssh_rule" {
  type              = "egress"
  description       = "ssh access"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tooling_nexus_sg.id
}

resource "aws_security_group_rule" "ingress_http_rule" {
  type              = "ingress"
  description       = "http access"
  from_port         = 8081
  to_port           = 8081
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tooling_nexus_sg.id
}

resource "aws_security_group" "tooling_nexus_lb_sg" {
  name = var.vpc_security_group_lb_ids
  description = "sg to allow access to app"
  vpc_id      = var.vpc_id
  tags = {
    Name = "tooling-app-lb-sg"
  }
}

resource "aws_security_group_rule" "ingress_lb_ssh_rule" {
  type              = "ingress"
  description       = "ssh access"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tooling_nexus_lb_sg.id
}

resource "aws_security_group_rule" "egress_lb_ssh_rule" {
  type              = "egress"
  description       = "ssh access"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tooling_nexus_lb_sg.id
}

resource "aws_security_group_rule" "ingress_lb_http_rule" {
  type              = "ingress"
  description       = "http access"
  from_port         = 8081
  to_port           = 8081
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tooling_nexus_lb_sg.id
}

resource "aws_security_group_rule" "ingress_lb_https_rule" {
  type              = "ingress"
  description       = "https access"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tooling_nexus_lb_sg.id
}

