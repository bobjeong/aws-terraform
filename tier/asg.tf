// WEB
resource "aws_launch_configuration" "web_launch_configuration" {
  name   = "${local.web_name}-launch-configuration"
  image_id      = var.web_instance_ami
  instance_type = var.web_instance_type
  key_name      = var.common_key_pair_name

  associate_public_ip_address = false
  security_groups = [module.security_group_web.security_group_id]

//  user_data = <<-EOF
//            #!/bin/bash
//            sudo docker run -p 80:80 nginx
//            EOF
}

resource "aws_autoscaling_group" "web_autoscaling_group" {
  name = "${local.web_name}-auto-scaling"
  launch_configuration = aws_launch_configuration.web_launch_configuration.name
  vpc_zone_identifier  = [ aws_subnet.web_private_subnet_1.id, aws_subnet.web_private_subnet_2.id ]

  force_delete = true

  desired_capacity   = var.web_desired_capacity
  max_size           = var.web_max_size
  min_size           = var.web_min_size

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "${local.web_name}-asg-ec2"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "web_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.web_autoscaling_group.id
  alb_target_group_arn   = aws_lb_target_group.web_alb_target_group.arn
}


// WAS
resource "aws_launch_configuration" "was_launch_configuration" {
  name   = "${local.was_name}-launch-configuration"
  image_id      = var.was_instance_ami
  instance_type = var.web_instance_type
  key_name      = var.common_key_pair_name

  associate_public_ip_address = false
  security_groups = [module.security_group_was.security_group_id]

//  user_data = <<-EOF
//            #!/bin/bash
//            sudo docker run -p 8080:80 nginx
//            EOF
}


resource "aws_autoscaling_group" "asg_was" {

  name = "${local.was_name}-auto-scaling"
  launch_configuration = aws_launch_configuration.was_launch_configuration.name
  vpc_zone_identifier  = [ aws_subnet.was_private_subnet_1.id, aws_subnet.was_private_subnet_2.id ]

  force_delete = true

  desired_capacity   = var.was_desired_capacity
  max_size           = var.was_max_size
  min_size           = var.was_min_size

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "${local.was_name}-asg-ec2"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "was_asg_attachment" {

  autoscaling_group_name = aws_autoscaling_group.asg_was.id
  alb_target_group_arn   = aws_lb_target_group.was_alb_target_group.arn
}

