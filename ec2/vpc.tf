module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.vpc_name
  cidr = var.vpc_cidr
  azs  = var.azs

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnets = [for index in range(2):
                      cidrsubnet(var.subnet_cidr, 4, index)]

  private_subnets = [for index in range(2):
                      cidrsubnet(var.subnet_cidr, 4, index+2)]
}
