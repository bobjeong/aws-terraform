variable "region" {
  type        = string
  default     = "ap-northeast-2"
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
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = null
}

variable "tier" {
  description = "Dynamic Tier"
  type        = number
  default     = 3
}

variable "create_rds" {
  description = "Dynamic Create RDS"
  type        = bool
  default     = false
}

variable "subnet_cidr" {
  description = "A list of subnets to place the EKS cluster and workers within."
  type = string
  default = "10.0.1.0/20"
}

variable "public_subnet_count" {
  description = "Public Subnet Count (default: 2)"
  type        = number
  default     = 2
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type = list(string)
  default = []
}

# Bastion
variable "bastion_ami" {
  description = "EC2 Bastion Instance Ami Id"
  type        = string
  default     = "ami-0263588f2531a56bd"
}

variable "bastion_instance_name" {
  description = "EC2 Bastion Instance Name"
  type        = string
  default     = "ntier-bastion"
}

variable "bastion_instance_type" {
  description = "EC2 Bastion Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "bastion_key_pair_name" {
  description = "EC2 Bastion Key Pair Name"
  type        = string
  default     = "bastion-key-pair"
}

variable "bastion_ingress_rule" {
  description = "Bastion Instance Security Group Ingress Rule"
  type        = list(string)
  default     = ["ssh-tcp"]
}

variable "bastion_egress_rule" {
  description = "Bastion Instance Security Group Egress Rule"
  type        = list(string)
  default     = ["all-all"]
}

variable "bastion_ingress_cidr_blocks" {
  description = "Bastion Instance Security Group Ingress Cidr Blocks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "common_key_pair_name" {
  description = "Common Resources Used Key Pair Name"
  type        = string
  default     = "ec2-key-pair"
}

variable "web_name" {
  type        = string
  default     = null
}

variable "web_instance_type" {
  description = "EC2 Web Server Instance Type"
  default     = "t2.micro"
}

variable "web_instance_ami" {
  description = "EC2 Web Server Instance Ami Type"
  default     = "ami-000ff44d5a5ba86e5" // ubuntu docker
}

variable "web_alb_name" {
  type        = string
  default     = null
}

variable "web_ingress_rule" {
  description = "Web Instance Security Group Ingress Rule"
  type        = list(string)
  default     = ["ssh-tcp", "http-80-tcp"]
}

variable "web_egress_rule" {
  description = "Web Instance Security Group Egress Rule"
  type        = list(string)
  default     = ["all-all"]
}

variable "web_ingress_cidr_blocks" {
  description = "Web Instance Security Group Ingress Cidr Blocks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "was_name" {
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
  default     = "ami-000ff44d5a5ba86e5" // ubuntu docker
}

variable "was_alb_name" {
  type        = string
  default     = null
}

variable "was_ingress_rule" {
  description = "Web Instance Security Group Ingress Rule"
  type        = list(string)
  default     = ["ssh-tcp", "http-8080-tcp"]
}

variable "was_egress_rule" {
  description = "Web Instance Security Group Egress Rule"
  type        = list(string)
  default     = ["all-all"]
}

variable "was_ingress_cidr_blocks" {
  description = "Web Instance Security Group Ingress Cidr Blocks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "db_name" {
  type        = string
  default     = null
}

variable "db_user_name" {
  type        = string
  default     = null
}

variable "db_user_pass" {
  type        = string
  default     = null
}

variable "db_engine" {
  type        = string
  default     = null
}

variable "db_engine_version" {
  type        = string
  default     = null
}

