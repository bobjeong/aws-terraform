output "region" {
  description = "AWS region."
  value = var.region
}

# VPC
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value = module.vpc.vpc_cidr_block
}

# Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value = module.vpc.private_subnets
}

output "private_subnets_cidr" {
  description = "List of IDs of private subnets"
  value = module.vpc.private_subnets_cidr_blocks
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value = module.vpc.public_subnets
}

output "public_subnets_cidr" {
  description = "List of IDs of public subnets"
  value = module.vpc.public_subnets_cidr_blocks
}

# NAT gateways
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value = module.vpc.nat_public_ips
}

# AZs
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value = module.vpc.azs
}

# LB
output "security_group_alb_id" {
  description = "The ID of the security group"
  value = module.security_group_alb.security_group_id
}

output "lb_id" {
  description = "The ID and ARN of the load balancer we created."
  value = module.alb.lb_id
}

output "lb_arn" {
  description = "The ID and ARN of the load balancer we created."
  value = module.alb.lb_arn
}

# EFS
output "efs_id" {
  description = "Created EFS ID"
  value = module.efs.efs_id
}

output "efs_mount_target_ids" {
  description = "Created EFS ID"
  value = module.efs.efs_mount_target_ids
}

# EKS
output "cluster_id" {
  description = ""
  value = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane."
  value = module.eks.cluster_security_group_id
}

output "kubectl_config" {
  description = "kubectl config as generated by the module."
  value = module.eks.kubeconfig
}

output "config_map_aws_auth" {
  description = "A kubernetes configuration to authenticate to this EKS cluster."
  value = module.eks.config_map_aws_auth
}