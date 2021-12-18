module "zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "2.0"

  zones = {
    "${var.cluster_name}.${var.root_domain}" = {
      comment = "${var.cluster_name}.${var.root_domain}"
    }
  }
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  zone_name = keys(module.zones.route53_zone_zone_id)[0]
  version = "2.0"

  records = [
    {
      name = "web"
      type = "A"
      alias = {
        name = aws_lb.web_alb.dns_name
        zone_id = aws_lb.web_alb.zone_id
        evaluate_target_health = true
      }
    },
    {
      name = "was"
      type = "A"
      alias = {
        name = aws_lb.was_alb.dns_name
        zone_id = aws_lb.was_alb.zone_id
        evaluate_target_health = true
      }
    }
  ]

  depends_on = [module.zones]
}

//module "acm" {
//  source = "terraform-aws-modules/acm/aws"
//  domain_name = "*.${var.cluster_name}.${var.root_domain}"
//  subject_alternative_names = ["${var.cluster_name}.${var.root_domain}"]
//  zone_id =  keys(module.zones.route53_zone_name)[0]
//  depends_on = [module.zones]
//}