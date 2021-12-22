resource "aws_launch_configuration" "web_launch_configuration" {
  count = local.create_web ? 1 : 0

  name          = local.web_launch_configuration_name
  image_id      = var.web_instance_ami
  instance_type = var.web_instance_type
  key_name      = var.common_key_pair_name

  associate_public_ip_address = false
  security_groups = [module.security_group_web.security_group_id]

  user_data = <<-EOF
            #!/bin/bash
            sudo docker run -p 80:80 nginx
            EOF
}

resource "aws_autoscaling_group" "web_autoscaling_group" {
  count = local.create_web ? 1 : 0

  name                 = local.web_autoscaling_group_name
  launch_configuration = aws_launch_configuration.web_launch_configuration[count.index].name
  vpc_zone_identifier  = var.subnets
  force_delete         = true

  desired_capacity   = var.web_desired_capacity
  max_size           = var.web_max_size
  min_size           = var.web_min_size

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = local.web_instance_tag_name
    propagate_at_launch = true
  }
}