
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  name    = local.alb_name
  vpc_id  = module.vpc.vpc_id == "" ? var.vpc_id : module.vpc.vpc_id
  subnets = module.vpc.public_subnets
  internal = true

  load_balancer_type = "application"
  security_groups    = [module.security_group_alb.security_group_id]

  http_tcp_listeners = [
    # Forward action is default, either when defined or undefined
    {
      port = 80
      protocol = "HTTP"
      target_group_index = 0
      action_type = "forward"
    },
  ]

//  https_listeners = [
//    {
//      port = 443
//      protocol = "HTTPS"
//      certificate_arn = module.acm.acm_certificate_arn
//      target_group_index = 0
//      action_type = "forward"
//    },
//  ]

  target_groups = [
    {
      name = "${local.alb_name}-target"
      backend_protocol = "HTTP"
      backend_port = 32000
      target_type = "instance"
      deregistration_delay = 10
      health_check = {
        enabled = true
        interval = 30
        path = "/healthz"
        port = "traffic-port"
        healthy_threshold = 3
        unhealthy_threshold = 3
        timeout = 6
        protocol = "HTTP"
        matcher = "200-399"
      }
    },
  ]
}