locals {
// common values
  create_web = length(var.instance_subnet_ids) > 0 ? true : false

  web_instance_tag_name          = format("%s-%s", var.cluster_name, "web-ec2")
  web_launch_configuration_name  = format("%s-%s", var.cluster_name, "web-launch-configuration")
  web_autoscaling_group_name     = format("%s-%s", var.cluster_name, "web-auto-scaling")
  web_security_group_name        = format("%s-%s", var.cluster_name, "web-sg")
  web_alb_security_group_name    = format("%s-%s", var.cluster_name, "web-alb-sg")
  web_target_group_name          = format("%s-%s", var.cluster_name, "web-tg")
  web_alb_name                   = format("%s-%s", var.cluster_name, "web-alb")
}