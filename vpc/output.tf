output "infra_vpc_id" {
  value = aws_vpc.infra_vpc.id
}

output "public_subnets_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "web_security_group_id" {
  value = aws_security_group.web_security_group.id
}

output "alb_security_group_id" {
  value = aws_security_group.alb_security_group.id
}
