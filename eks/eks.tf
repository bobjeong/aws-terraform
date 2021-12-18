provider "kubernetes" {
  host = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token = data.aws_eks_cluster_auth.cluster.token
}

module "eks" {
  source = "terraform-aws-modules/eks/aws"

  vpc_id                 = module.vpc.vpc_id
  cluster_name           = local.cluster_name
  cluster_version        = var.cluster_version
  subnets                = module.vpc.private_subnets
  kubeconfig_output_path = var.config_output_path

  workers_group_defaults = {
    key_name = var.common_key_pair_name

    tags = [
      {
        key = "k8s.io/cluster-autoscaler/enabled"
        value = "true"
        propagate_at_launch = "true"
      },
      {
        key = "k8s.io/cluster-autoscaler/${local.cluster_name}"
        value = "owned"
        propagate_at_launch = "true"
      }
    ]
    enabled_metrics = [
      "GroupDesiredCapacity",
      "GroupInServiceInstances",
      "GroupMaxSize",
      "GroupMinSize",
      "GroupPendingInstances",
      "GroupStandbyInstances",
      "GroupTerminatingInstances",
      "GroupTotalInstances",
    ]
  }

  workers_additional_policies = [
    module.iam_policy_autoscaling.arn,
    module.iam_policy_efs.arn,
  ]

  worker_groups_launch_template = [
    {
      name = "${local.cluster_name}-mixed"
      key_name = var.common_key_pair_name

      override_instance_types = var.asg_instance_types
      asg_desired_capacity    = var.asg_desired_capacity
      asg_min_size            = var.asg_min_size
      asg_max_size            = var.asg_max_size
      on_demand_percentage_above_base_capacity = 100

      target_group_arns = module.alb.target_group_arns

      additional_security_group_ids = [
        module.security_group_alb.security_group_id
      ]
    }
  ]

  map_roles = [
    {
      rolearn = "arn:aws:iam::${local.user_account}:role/${aws_iam_role.bastion_instance_role.name}"
      username = "iam_role_bastion"
      groups = [
        "system:masters"]
    }
  ]
  map_users = [
    {
      userarn = "arn:aws:iam::${local.user_account}:user/${local.user_id}"
      username = "${local.user_id}"
      groups = [
        "system:masters"]
    }
  ]
}