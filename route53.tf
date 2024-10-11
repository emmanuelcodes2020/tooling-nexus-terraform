resource "aws_route53_record" "tooling_nexus_route53" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = aws_lb.nexus_lb.dns_name
    zone_id                = aws_lb.nexus_lb.zone_id
    evaluate_target_health = true
  }
}
