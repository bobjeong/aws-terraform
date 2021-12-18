locals {
  user_account = data.aws_caller_identity.current.account_id
  user_id      = data.aws_caller_identity.current.user_id

  # set resource name
  bastion_name = var.bastion_instance_name != "" ? var.bastion_instance_name : lower("${var.cluster_name}-bastion")
  vpc_name     = var.vpc_name != "" ? var.vpc_name : lower("${var.cluster_name}-vpc")
  web_name     = var.web_name != "" ? var.web_name : lower("${var.cluster_name}-web")
  was_name     = var.was_name != "" ? var.was_name : lower("${var.cluster_name}-was")
  web_alb      = var.web_alb_name != "" ? var.web_alb_name : lower("${var.cluster_name}-web-alb")
  was_alb      = var.was_alb_name != "" ? var.was_alb_name : lower("${var.cluster_name}-was-alb")
  db_name      = var.db_name != "" ? var.db_name : lower("${var.cluster_name}-rds")
}