variable "region" {
  default = "ap-northeast-2"
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type = list(string)
  default = []
}

variable "cluster_id" {
  description = "Cluster Id"
  type = string
  default = "-1"
}

variable "stage_tag" {
  description = "Global Env Tag"
  type        = string
  default     = "dev"
}

variable "common_key_pair_name" {
  description = "eks worker key name"
  default = ""
}

# VPC
variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "The VPC ID."
  default = ""
}

variable "vpc_cidr" {
  description = "VPC CIDR Range"
  type = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "A list of subnets to place the EKS cluster and workers within."
  type = string
  default = "10.0.1.0/20"
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type = bool
  default = true
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type = bool
  default = true
}

# Bastion
variable "bastion_ami" {
  description = "EC2 Bastion Instance Ami Id"
  type = string
  default = "ami-0263588f2531a56bd"
}

variable "bastion_instance_name" {
  description = "EC2 Bastion Instance Name"
  type = string
  default = "eks-bastion"
}

variable "bastion_instance_type" {
  description = "EC2 Bastion Instance Type"
  type = string
  default = "t2.micro"
}

variable "bastion_key_pair_name" {
  description = "EC2 Bastion Key Pair Name"
  type = string
  default = "bastion-keypair"
}


variable "bastion_instance_role_policy" {
  description = "EC2 Bastion Assum Role Policy"
  type = string
  default = <<EOF
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

# EKS
variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
  default     = ""
}

variable "cluster_version" {
  description = "Kubernetes minor version to use for the EKS cluster (default 1.21)."
  type        = string
  default     = "1.21"
}

variable "config_output_path" {
  description = "Where to save the Kubectl config file. Assumed to be a directory if the value ends with a forward slash `/`."
  type        = string
  default     = "."
}

variable "asg_desired_capacity" {
  description = "Auto Scaling Group Desired Capacity (Default 2)"
  type        = number
  default     = 2
}

variable "asg_min_size" {
  description = "Auto Scaling Group Min Size (Default 1)"
  type        = number
  default     = 1
}

variable "asg_max_size" {
  description = "Auto Scaling Group Max Size (Default 5)"
  type        = number
  default     = 5
}

variable "asg_instance_types" {
  description = "Auto Scaling Group Instance Types"
  type        = list(string)
  default     = ["t3.medium", "t3.xlarge"]
}

# variable "map_accounts" {
#   description = "Additional AWS account numbers to add to the aws-auth configmap. See examples/basic/variables.tf for example format."
#   type = list(string)
#   default = []
# }

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap. See examples/basic/variables.tf for example format."
  type = list(object({
    rolearn = string
    username = string
    groups = list(string)
  }))
  default = []
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap. See examples/basic/variables.tf for example format."
  type = list(object({
    userarn = string
    username = string
    groups = list(string)
  }))
  default = []
}

# ALB
variable "alb_name" {
  description = "ALB Name"
  default = ""
}

# EFS
variable "efs_name" {
  description = "EFS Name"
  default = ""
}

# ECR
variable "ecr_name" {
  description = "ECR Namr"
  default = ""
}

