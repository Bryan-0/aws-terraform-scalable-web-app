# Set up the VPC we will use in our scalable web app
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
  instance_type = "t2.nano"
}
