resource "aws_lb" "web_alb" {
  count = local.create_web ? 1 : 0

  name = local.web_alb_name
  internal = false
  load_balancer_type = "application"
  security_groups = [module.security_group_web_alb.security_group_id]
  subnets = var.alb_subnet_ids
}

resource "aws_lb_target_group" "web_alb_target_group" {
  count = local.create_web ? 1 : 0

  name = local.web_target_group_name
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "web_alb_listener" {
  count = local.create_web ? 1 : 0

  load_balancer_arn = aws_lb.web_alb[0].arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.web_alb_target_group[0].arn
  }
}