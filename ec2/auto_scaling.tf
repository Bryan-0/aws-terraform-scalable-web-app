resource "aws_autoscaling_group" "web_app_auto_scaling_group" {
  name                = "WebAppASG"
  vpc_zone_identifier = var.public_subnet_ids

  desired_capacity = var.auto_scaling_conf["desired_capacity"]
  max_size         = var.auto_scaling_conf["max_size"]
  min_size         = var.auto_scaling_conf["min_size"]

  launch_template {
    id      = aws_launch_template.web_app_launch_template.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "web_app_alb_attachment" {
  autoscaling_group_name = aws_autoscaling_group.web_app_auto_scaling_group.id
  lb_target_group_arn    = aws_lb_target_group.web_app_target_group.arn
}
