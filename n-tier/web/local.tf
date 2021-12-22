locals {
// common values
  create_web = length(var.subnets) > 0 ? true : false

  name                           = var.cluster_name
  web_instance_tag_name          = "${local.name}-ec2"
  web_launch_configuration_name  = "${local.name}-launch-configuration"
  web_autoscaling_group_name     = "${local.name}-auto-scaling"
  web_security_group_name        = "${local.name}-sg"
}