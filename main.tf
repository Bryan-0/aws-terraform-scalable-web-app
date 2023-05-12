# Set up all custom VPC logic
module "vpc" {
  source       = "./vpc"
  infra_region = var.infra_region

  cidr_block = "11.0.0.0/16"
  public_subnets = [
    "11.0.1.0/24",
    "11.0.2.0/24",
    "11.0.3.0/24"
  ]
  availability_zones = [
    "${var.infra_region}a",
    "${var.infra_region}b",
    "${var.infra_region}c"
  ]
  vpc_name             = "Infra VPC"
  enable_dns_hostnames = true
}

# Set up our web instances, auto-scaling group and load balancer.
module "ec2" {
  source       = "./ec2"
  infra_region = var.infra_region
  infra_vpc_id = module.vpc.infra_vpc_id

  public_subnet_ids = module.vpc.public_subnets_ids

  web_security_group_id = module.vpc.web_security_group_id
  alb_security_group_id = module.vpc.alb_security_group_id

  auto_scaling_conf = {
    "desired_capacity" = 2
    "max_size"         = 3
    "min_size"         = 1
  }
  instance_type         = "t2.nano"
  instance_profile_name = module.iam.s3_access_instance_profile_name
}

# Set up our generic web bucket, in case we want to store any type of file to later be retrieved.
module "s3" {
  source       = "./s3"
  infra_region = var.infra_region

  # bucket_name = "<custom bucket name>" (If not defined, we will generate one unique randomly named)
}

# Policies & Roles Setup
module "iam" {
  source             = "./iam"
  web_app_bucket_arn = module.s3.web_app_bucket_arn
}

# Set up DNS Records - (Must have a hosted zone already created)
module "route53" {
  source = "./route53"

  web_domain      = var.web_domain
  web_alb_dns     = module.ec2.alb_dns_name
  web_alb_zone_id = module.ec2.alb_zone_id
  acm_arn         = module.acm.acm_certificate_arn
}

# Set up SSL for our web app
module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  # The Certificate must be created in us-east-1, CloudFront only supports certificates created in that region.
  providers = {
    aws = aws.acm
  }

  domain_name = var.web_domain
  zone_id     = module.route53.zone_id

  wait_for_validation = true

  tags = {
    Name = var.web_domain
  }
}
