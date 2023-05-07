resource "aws_route53_zone" "web_app_hosted_zone" {
  name    = var.web_domain
  comment = "Web App Hosted Zone managed by Terraform."
}

resource "aws_route53_record" "alb_record" {
  zone_id = aws_route53_zone.web_app_hosted_zone.zone_id
  name    = var.web_domain
  type    = "A"

  alias {
    name                   = var.web_alb_dns
    zone_id                = var.web_alb_zone_id
    evaluate_target_health = true
  }
}
