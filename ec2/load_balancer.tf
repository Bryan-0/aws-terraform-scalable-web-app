resource "aws_alb" "web_app_alb" {
  name            = "WebAppALB"
  internal        = false
  security_groups = [var.alb_security_group_id]
  subnets         = var.public_subnet_ids
  # enable_deletion_protection = true
}

resource "aws_lb_listener" "web_app_alb_listener" {
  load_balancer_arn = aws_alb.web_app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_app_target_group.arn
  }
}

resource "aws_lb_target_group" "web_app_target_group" {
  name     = "WebAppTG"
  protocol = "HTTP"
  port     = 80
  vpc_id   = var.infra_vpc_id
}
