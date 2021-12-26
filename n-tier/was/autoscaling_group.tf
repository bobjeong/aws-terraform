resource "aws_launch_configuration" "was_launch_configuration" {
  count = local.create_was ? 1 : 0

  name          = local.was_launch_configuration_name
  image_id      = var.was_instance_ami
  instance_type = var.was_instance_type
  key_name      = var.common_key_pair_name

  associate_public_ip_address = false
  security_groups = [module.security_group_was.security_group_id]

  user_data = <<-EOF
            #!/bin/bash
            sudo docker run -p 80:80 nginx
            EOF
}

resource "aws_autoscaling_group" "was_autoscaling_group" {
  count = local.create_was ? 1 : 0

  name                 = local.was_autoscaling_group_name
  launch_configuration = aws_launch_configuration.was_launch_configuration[count.index].name
  vpc_zone_identifier  = var.instance_subnet_ids
  force_delete         = true

  desired_capacity   = var.was_desired_capacity
  max_size           = var.was_max_size
  min_size           = var.was_min_size

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = local.was_instance_tag_name
    propagate_at_launch = true
  }
}