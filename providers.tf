provider "aws" {
  region = var.infra_region
}

provider "aws" {
  region = "us-east-1"
  alias  = "acm"
}
