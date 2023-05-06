resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.infra_vpc.id

  tags = {
    Name = "Infra Internet Gateway"
  }
}
