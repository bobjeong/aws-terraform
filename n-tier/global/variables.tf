variable "region" {
  type        = string
  default     = "ap-northeast-2"
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}

variable "cluster_name" {
  description = "All Resource Prefix Name"
  type        = string
  default     = null
}

variable "root_domain" {
  description = "Root Domain"
  type        = string
  default     = null
}

# VPC
variable "vpc_id" {
  description = "The VPC ID."
  type        = string
  default     = null
}

variable "vpc_cidr" {
  description = "VPC CIDR Range"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = null
}

variable "tier" {
  description = "Dynamic Tier"
  type        = number
  default     = null
}

variable "create_rds" {
  description = "Dynamic Create RDS"
  type        = bool
  default     = false
}

variable "subnet_cidr" {
  description = "A list of subnets to place the EKS cluster and workers within."
  type        = string
  default     = "10.0.1.0/20"
}

variable "public_subnet_count" {
  description = "Public Subnet Count (default: 2)"
  type        = number
  default     = null
}

# Bastion
variable "bastion_ami" {
  description = "EC2 Bastion Instance Ami Id"
  type        = string
  default     = null
}

variable "bastion_instance_name" {
  description = "EC2 Bastion Instance Name"
  type        = string
  default     = null
}

variable "bastion_instance_type" {
  description = "EC2 Bastion Instance Type"
  type        = string
  default     = null
}

variable "bastion_key_pair_name" {
  description = "EC2 Bastion Key Pair Name"
  type        = string
  default     = null
}

variable "bastion_instance_role_policy" {
  description = "EC2 Bastion Assum Role Policy"
  type        = string
  default     = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": ["ec2.amazonaws.com"]
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

variable "bastion_ingress_rule" {
  description = "Bastion Instance Security Group Ingress Rule"
  type        = list(string)
  default     = null
}

variable "bastion_egress_rule" {
  description = "Bastion Instance Security Group Egress Rule"
  type        = list(string)
  default     = null
}

variable "bastion_ingress_cidr_blocks" {
  description = "Bastion Instance Security Group Ingress Cidr Blocks"
  type        = list(string)
  default     = null
}