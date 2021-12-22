locals {
  //common value
  name = var.cluster_name

  public_subnet_count  = var.public_subnet_count
  private_subnet_count = var.tier > 1 ? (var.tier - 1) * 2 : 0

  public_subnets      = [for index in range(local.public_subnet_count):
                          cidrsubnet(var.subnet_cidr, 4, index)]
  private_subnets     = [for index in range(local.private_subnet_count):
                          cidrsubnet(var.subnet_cidr, 4, index + local.public_subnet_count)]

  vpc_tag_name        = "${local.name}-vpc"
  public_subnet_name  = "${local.name}-public-subnet"
  private_subnet_name = "${local.name}-private-subnet"
}