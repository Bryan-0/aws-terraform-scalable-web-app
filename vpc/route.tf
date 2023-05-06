resource "aws_route" "igw_route_infra_vpc" {
  route_table_id         = data.aws_route_table.infra_main_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
