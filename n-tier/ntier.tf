module "global" {
  source = "./global"

  cluster_name = var.cluster_name
  region       = var.region
  azs          = var.azs
}

module "web" {
  source = "./web"
  cluster_name = var.cluster_name
  region       = var.region
  azs          = var.azs

  vpc_id       = module.global.vpc_id
  subnets      = var.web_is_public ? module.global.public_subnets : slice(module.global.private_subnets, 0, 2)

  web_ingress_rule        = ["ssh-tcp", "http-80-tcp"]
  web_egress_rule         = ["all-all"]
  web_ingress_cidr_blocks = ["0.0.0.0/0"]

}

