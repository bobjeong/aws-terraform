resource "aws_lb" "was_alb" {
  count = local.create_was ? 1 : 0

  name     = local.was_alb_name
  internal = var.is_internal

  load_balancer_type = "application"
  security_groups = [module.security_group_was_alb.security_group_id]
  subnets = var.alb_subnet_ids
}

resource "aws_lb_target_group" "was_alb_target_group" {
  count = local.create_was ? 1 : 0

  name     = local.was_target_group_name
  port     = "8080"
  protocol = "HTTP"
  vpc_id = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "was_alb_listener" {
  count = local.create_was ? 1 : 0

  load_balancer_arn = aws_lb.was_alb[0].arn
  port     = "8080"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.was_alb_target_group[0].arn
  }
}