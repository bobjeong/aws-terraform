module "security_group_web" {
  create = local.create_web

  source = "terraform-aws-modules/security-group/aws"
  vpc_id = var.vpc_id
  name   = local.web_security_group_name

  ingress_cidr_blocks = var.web_ingress_cidr_blocks
  ingress_rules       = var.web_ingress_rule
  egress_rules        = var.web_egress_rule
}

module "security_group_web_alb" {
  create = local.create_web

  source = "terraform-aws-modules/security-group/aws"
  vpc_id = var.vpc_id
  name   = local.web_alb_security_group_name

  ingress_cidr_blocks = [
    "0.0.0.0/0"]
  ingress_rules = [
    "http-80-tcp"]
  egress_rules = [
    "all-all"]
}