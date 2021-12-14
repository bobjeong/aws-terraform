module "security_group_bastion" {
  source = "terraform-aws-modules/security-group/aws"
  vpc_id = module.vpc.vpc_id
  name   = "${local.bastion_name}-sg"
  description = "Security group for Bation SSH"

  ingress_cidr_blocks = [
    "0.0.0.0/0"]
  ingress_rules = [
    "ssh-tcp"]
  egress_rules = [
    "all-all"]
}

module "security_group_alb" {
  source = "terraform-aws-modules/security-group/aws"
  vpc_id = module.vpc.vpc_id
  name   = "${local.alb_name}-sg"
  description = "Security group for ALB"

  ingress_cidr_blocks = [
    "0.0.0.0/0"]
  ingress_rules = [
    "http-80-tcp",
    "https-443-tcp"]
  egress_rules = [
    "all-all"]

  ingress_with_cidr_blocks = [
    {
      from_port = 32000
      to_port = 32000
      protocol = 6
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]
}
