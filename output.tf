output "aws_instance" {
  value = aws_instance.tooling_nexus.public_ip
}
output "aws_route53_record" {
  value = aws_route53_record.tooling_nexus_route53.name
}