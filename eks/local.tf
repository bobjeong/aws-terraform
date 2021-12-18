locals {
  user_account = data.aws_caller_identity.current.account_id
  user_id      = data.aws_caller_identity.current.user_id
  # default_record = "*.${var.origin}" Route53

  # set resource name
  cluster_name = var.cluster_name != "" ? var.cluster_name : lower("${var.cluster_id}-cluster")
  bastion_name = var.bastion_instance_name != "" ? var.bastion_instance_name : lower("${var.cluster_id}-bastion")
  vpc_name     = var.vpc_name != "" ? var.vpc_name : lower("${var.cluster_id}-vpc")
  alb_name     = var.alb_name != "" ? var.alb_name : lower("${var.cluster_id}-alb")
  efs_name     = var.efs_name != "" ? var.efs_name : lower("${var.cluster_id}-efs")
  ecr_name     = var.ecr_name != "" ? var.ecr_name : lower("${var.cluster_id}-ecr")
}