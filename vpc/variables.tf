variable "infra_region" {
  type = string
}
variable "vpc_name" {
  type = string
}
variable "cidr_block" {
  type = string
}
variable "public_subnets" {
  type = list(string)
}
variable "availability_zones" {
  type = list(string)
}
variable "enable_dns_hostnames" {
  default = false
}
