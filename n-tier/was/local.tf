locals {
// common values
  create_was = var.create && length(var.instance_subnet_ids) > 0 ? true : false

  was_instance_tag_name          = format("%s-%s", var.cluster_name, "was-ec2")
  was_launch_configuration_name  = format("%s-%s", var.cluster_name, "was-launch-configuration")
  was_autoscaling_group_name     = format("%s-%s", var.cluster_name, "was-auto-scaling")
  was_security_group_name        = format("%s-%s", var.cluster_name, "was-sg")
  was_alb_security_group_name    = format("%s-%s", var.cluster_name, "was-alb-sg")
  was_target_group_name          = format("%s-%s", var.cluster_name, "was-tg")
  was_alb_name                   = format("%s-%s", var.cluster_name, "was-alb")
}