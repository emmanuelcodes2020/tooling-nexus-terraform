resource "aws_lb" "nexus_lb" {
  name               = var.load_balancer
  internal           = false
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.tooling_nexus_lb_sg.id]
  subnets            = var.subnet_ranges
}

resource "aws_lb_target_group" "nexus_lb_tg" {
  name        = "nexus-lb-tg"
  target_type = "instance"
  port        = 8081
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  health_check {
    protocol            = "TCP"
    port                = 8081
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
  }

}

resource "aws_lb_listener" "nexus_lb_listener" {
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nexus_lb_tg.arn
  }
  load_balancer_arn = aws_lb.nexus_lb.arn
  port              = 443
  protocol          = "TLS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = aws_acm_certificate.cert.arn
  depends_on = [aws_lb_target_group.nexus_lb_tg]
}

resource "aws_lb_target_group_attachment" "nexus_tg_attachment" {
  target_group_arn = aws_lb_target_group.nexus_lb_tg.arn
  target_id        = aws_instance.tooling_nexus.id
  port             = 8081
}