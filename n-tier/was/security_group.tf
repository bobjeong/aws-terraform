module "security_group_was" {
  create = local.create_was

  source = "terraform-aws-modules/security-group/aws"
  vpc_id = var.vpc_id
  name   = local.was_security_group_name

  ingress_cidr_blocks = var.was_ingress_cidr_blocks
  ingress_rules       = var.was_ingress_rule
  egress_rules        = var.was_egress_rule
}

module "security_group_was_alb" {
  create = local.create_was

  source = "terraform-aws-modules/security-group/aws"
  vpc_id = var.vpc_id
  name   = local.was_alb_security_group_name
  description = "Security group for WAS ALB"

  ingress_cidr_blocks = [
    "0.0.0.0/0"]
  ingress_rules = [
    "http-8080-tcp"]
  egress_rules = [
    "all-all"]
}
