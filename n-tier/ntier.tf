locals {
  was_create = var.tier == 3 ? true : false
}

module "global" {
  source = "./global"

  cluster_name = var.cluster_name
  region       = var.region
  azs          = var.azs

  tier                = var.tier
  public_subnet_count = var.public_subnet_count

  # Bastion
  bastion_ami                 = var.bastion_ami
  bastion_instance_name       = var.bastion_instance_name
  bastion_instance_type       = var.bastion_instance_type
  bastion_key_pair_name       = var.bastion_key_pair_name

  bastion_ingress_rule        = var.bastion_ingress_rule
  bastion_egress_rule         = var.bastion_egress_rule
  bastion_ingress_cidr_blocks = var.bastion_ingress_cidr_blocks
}

module "web" {
  source = "./web"

  cluster_name = var.cluster_name
  region       = var.region
  azs          = var.azs

  vpc_id                  = module.global.vpc_id
  alb_subnet_ids          = module.global.public_subnet_ids
  instance_subnet_ids     = slice(module.global.private_subnet_ids, 0, 2)

  web_instance_ami        = var.web_instance_ami
  web_instance_type       = var.web_instance_type
  common_key_pair_name    = var.common_key_pair_name

  web_ingress_rule        = var.web_ingress_rule
  web_egress_rule         = var.web_egress_rule
  web_ingress_cidr_blocks = var.web_ingress_cidr_blocks
}

module "was" {
  source = "./was"

  create       = local.was_create
  cluster_name = var.cluster_name
  region       = var.region
  azs          = var.azs

  vpc_id                  = module.global.vpc_id
  alb_subnet_ids          = slice(module.global.private_subnet_ids, 0, 2)
  instance_subnet_ids     = slice(module.global.private_subnet_ids, 2, 4)

  was_instance_ami        = var.was_instance_ami
  was_instance_type       = var.was_instance_type
  common_key_pair_name    = var.common_key_pair_name

  was_ingress_rule        = var.was_ingress_rule
  was_egress_rule         = var.was_egress_rule
  was_ingress_cidr_blocks = var.was_ingress_cidr_blocks

}