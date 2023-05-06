resource "aws_launch_template" "web_app_launch_template" {
  name                   = "WebAppLT"
  image_id               = local.ami_image_id[var.infra_region]
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.web_security_group_id]
  user_data              = base64encode(file("${path.module}/userdata.bash"))
}
