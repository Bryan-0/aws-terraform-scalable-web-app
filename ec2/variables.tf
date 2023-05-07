variable "infra_region" {
  type = string
}
variable "public_subnet_ids" {
  type = list(string)
}
variable "web_security_group_id" {
  type = string
}
variable "alb_security_group_id" {
  type = string
}
variable "infra_vpc_id" {
  type = string
}
variable "auto_scaling_conf" {
  type = map(number)
  default = {
    "desired_capacity" = 1
    "max_size"         = 1
    "min_size"         = 1
  }
}
variable "instance_type" {
  type = string
}
variable "instance_profile_name" {
  type = string
}
