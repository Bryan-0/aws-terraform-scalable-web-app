resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnets)

  vpc_id = aws_vpc.infra_vpc.id

  # Dynamically adding on each count iteration
  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  map_public_ip_on_launch = true
}
