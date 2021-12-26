locals {
  //common value
  public_subnet_count  = var.public_subnet_count
  private_subnet_count = var.tier > 1 ? var.tier * 2 : 0

  public_subnets       = [for index in range(local.public_subnet_count):
                          cidrsubnet(var.subnet_cidr, 4, index)]
  private_subnets      = [for index in range(local.private_subnet_count):
                          cidrsubnet(var.subnet_cidr, 4, index + local.public_subnet_count)]

  public_subnet_name   = format("%s-%s", var.cluster_name, "public-subnet")
  public_nat_name      = format("%s-%s", var.cluster_name, "nat")
  public_nat_eip_name  = format("%s-%s", var.cluster_name, "eip")
  private_subnet_name  = format("%s-%s", var.cluster_name, "private-subnet")

  public_subnet_ids    = sort(data.aws_subnet_ids.public.ids)
  private_subnet_ids   = sort(data.aws_subnet_ids.private.ids)

  bastion_name         = format("%s-%s", var.cluster_name, "bastion")
  bastion_sg_name      = format("%s-%s", var.cluster_name, "bastion-sg")
  bastion_profile_name = format("%s-%s", var.cluster_name, "bastion-profile")
  bastion_role_name    = format("%s-%s", var.cluster_name, "bastion-role")
}