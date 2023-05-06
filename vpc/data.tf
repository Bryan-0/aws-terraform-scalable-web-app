data "aws_route_table" "infra_main_route_table" {
  vpc_id = aws_vpc.infra_vpc.id
}
