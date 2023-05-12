data "aws_route53_zone" "web_app_hosted_zone" {
  name         = var.web_domain
  private_zone = false
}

resource "aws_route53_record" "web_app_url" {
  name    = var.web_domain
  zone_id = data.aws_route53_zone.web_app_hosted_zone.zone_id
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.web_app_cf_dist.domain_name
    zone_id                = aws_cloudfront_distribution.web_app_cf_dist.hosted_zone_id
    evaluate_target_health = true
  }
}
