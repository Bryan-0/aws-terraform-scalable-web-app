output "alb_dns_name" {
  value = aws_alb.web_app_alb.dns_name
}
output "alb_zone_id" {
  value = aws_alb.web_app_alb.zone_id
}
