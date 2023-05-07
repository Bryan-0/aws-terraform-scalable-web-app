output "Bucket_Name" {
  value = module.s3.web_app_bucket_name
}

output "Application_LB_DNS" {
  value = module.ec2.alb_dns_name
}

output "Web_Domain" {
  value = "http://${var.web_domain}/"
}
