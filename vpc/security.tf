resource "aws_security_group" "web_security_group" {
  name   = "Web App Infra Access"
  vpc_id = aws_vpc.infra_vpc.id

  dynamic "ingress" {
    for_each = local.web_ingress_ports
    iterator = port

    content {
      protocol        = "TCP"
      from_port       = port.value
      to_port         = port.value
      security_groups = [aws_security_group.alb_security_group.id]
    }
  }

  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    protocol         = "-1"
    from_port        = 0
    to_port          = 0
  }

  tags = {
    Name = "Web App Infra Access"
  }
}

resource "aws_security_group" "alb_security_group" {
  name   = "ALB SG"
  vpc_id = aws_vpc.infra_vpc.id

  dynamic "ingress" {
    for_each = local.web_ingress_ports
    iterator = port

    content {
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      protocol         = "TCP"
      from_port        = port.value
      to_port          = port.value
    }
  }

  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    protocol         = "-1"
    from_port        = 0
    to_port          = 0
  }

  tags = {
    Name = "ALB SG Access"
  }
}
