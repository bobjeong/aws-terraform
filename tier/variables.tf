variable "region" {
  type        = string
  default     = "ap-northeast-2"
}

variable "cluster_name" {
  description = "All Resource Prefix Name"
  type        = string
  default     = "default"
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
  default     = ""
}

variable "subnet_cidr" {
  description = "A list of subnets to place the EKS cluster and workers within."
  type        = string
  default     = "10.0.1.0/20"
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
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
  default     = "tier-bastion"
}

variable "bastion_instance_type" {
  description = "EC2 Bastion Instance Type"
  type        = string
  default     = "t2.micro"
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

# WEB
variable "web_name" {
  description = "EC2 Web Server Instance Type"
  type        = string
  default     = null
}

variable "web_instance_type" {
  description = "EC2 Web Server Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "web_instance_ami" {
  description = "EC2 Web Server Instance Ami Type"
  type        = string
  default     = "ami-000ff44d5a5ba86e5" // ubuntu docker
}

variable "web_desired_capacity" {
  description = "WEB Auto Scaling Group Desired Capacity"
  type        = number
  default     = 2
}

variable "web_min_size" {
  description = "WEB Auto Scaling Group Min Size"
  type        = number
  default     = 2
}

variable "web_max_size" {
  description = "WEB Auto Scaling Group Max Size"
  type        = number
  default     = 4
}

variable "web_alb_name" {
  description = "WEB ALB Name"
  type        = string
  default     = null
}

# WAS

variable "was_name" {
  description = "EC2 Web Server Instance Type"
  type        = string
  default     = null
}

variable "was_instance_type" {
  description = "EC2 Web Server Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "was_instance_ami" {
  description = "EC2 Web Server Instance Ami Type"
  type        = string
  default     = null
}

variable "was_desired_capacity" {
  description = "WAS Auto Scaling Group Desired Capacity"
  type        = number
  default     = 2
}

variable "was_min_size" {
  description = "WAS Auto Scaling Group Min Size"
  type        = number
  default     = 2
}

variable "was_max_size" {
  description = "WAS Auto Scaling Group Max Size"
  type        = number
  default     = 4
}

variable "was_alb_name" {
  description = "WAS ALB Name"
  default     = null
}

# RDS
variable "db_name" {
  description = "RDS Name"
  type        = string
  default     = null
}

variable "db_user_name" {
  description = "RDS User Password"
  type        = string
  default     = null
}

variable "db_user_pass" {
  description = "RDS User Password"
  type        = string
  default     = null
}

variable "db_engine" {
  description = "RDS DB Engine"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "RDS DB Engine Version"
  type        = string
  default     = "5.7"
}

variable "db_engine_instance_class" {
  description = "RDS DB Engine Instance Class"
  type        = string
  default     = "db.t2.micro"
}

variable "common_key_pair_name" {
  description = "Common Resources Used Key Pair Name"
  type        = string
  default     = null
}

