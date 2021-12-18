module "security_group_bastion" {
  source = "terraform-aws-modules/security-group/aws"
  vpc_id = aws_vpc.tier_vpc.id
  name   = "${local.bastion_name}-sg"
  description = "Security group for Bastion"

  ingress_cidr_blocks = [
    "0.0.0.0/0"]
  ingress_rules = [
    "ssh-tcp"]
  egress_rules = [
    "all-all"]
}

module "security_group_web" {
  source = "terraform-aws-modules/security-group/aws"
  vpc_id = aws_vpc.tier_vpc.id
  name   = "${local.web_name}-sg"
  description = "Security group for Web"

  ingress_cidr_blocks = [
    "0.0.0.0/0"]
  ingress_rules = [
    "ssh-tcp",
    "http-80-tcp"]
  egress_rules = [
    "all-all"]
}

module "security_group_was" {
  source = "./common/terraform-aws-security-group"
  vpc_id = aws_vpc.tier_vpc.id
  name   = "${local.was_name}-sg"
  description = "Security group for Was"

  ingress_cidr_blocks = [
    "0.0.0.0/0"]
  ingress_rules = [
    "ssh-tcp",
    "http-8080-tcp"]
  egress_rules = [
    "all-all"]
}


module "security_group_web_alb" {
  source = "terraform-aws-modules/security-group/aws"
  vpc_id = aws_vpc.tier_vpc.id
  name   = "${local.web_alb}-sg"
  description = "Security group for WEB ALB"

  ingress_cidr_blocks = [
    "0.0.0.0/0"]
  ingress_rules = [
    "http-80-tcp"]
  egress_rules = [
    "all-all"]
}

module "security_group_was_alb" {
  source = "terraform-aws-modules/security-group/aws"
  vpc_id = aws_vpc.tier_vpc.id
  name   = "${local.was_alb}-sg"
  description = "Security group for WAS ALB"

  ingress_cidr_blocks = [
    "0.0.0.0/0"]
  ingress_rules = [
    "http-8080-tcp"]
  egress_rules = [
    "all-all"]
}

module "security_group_rds" {
  source = "terraform-aws-modules/security-group/aws"
  vpc_id = aws_vpc.tier_vpc.id
  name   = "${local.db_name}-sg"
  description = "Security group for RDS"

  ingress_cidr_blocks = [
    "0.0.0.0/0"]
  ingress_rules = [
    "${var.db_engine}-tcp"]
  egress_rules = [
    "all-all"]
}