module "efs" {
  source     = "./modules/efs"

  name       = local.efs_name
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  mount_target_sg = [
    module.eks.worker_security_group_id]
}
