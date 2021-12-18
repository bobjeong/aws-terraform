# WEB
resource "aws_lb" "web_alb" {
  name = local.web_alb
  internal = false
  load_balancer_type = "application"
  security_groups = [module.security_group_web_alb.security_group_id]
  subnets = [
    aws_subnet.tier_public_subnet_1.id,
    aws_subnet.tier_public_subnet_2.id
  ]
}

resource "aws_lb_target_group" "web_alb_target_group" {
  name = "${local.web_name}-web-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.tier_vpc.id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "web_alb_listener" {
  load_balancer_arn = aws_lb.web_alb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.web_alb_target_group.arn
  }
}


# Was
resource "aws_lb" "was_alb" {
  name = local.was_alb
  internal = true
  load_balancer_type = "application"
  security_groups = [module.security_group_was_alb.security_group_id]
  subnets = [
    aws_subnet.web_private_subnet_1.id,
    aws_subnet.web_private_subnet_2.id
  ]
}

resource "aws_lb_target_group" "was_alb_target_group" {
  name = "${local.was_name}-was-tg"
  port = 8080
  protocol = "HTTP"
  vpc_id = aws_vpc.tier_vpc.id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "was_alb_listener" {
  load_balancer_arn = aws_lb.was_alb.arn
  port = "8080"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.was_alb_target_group.arn
  }
}