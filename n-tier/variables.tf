variable "region" {
  default = "ap-northeast-2"
}

variable "cluster_name" {
  description = "All Resource Prefix Name"
  type        = string
  default     = ""
}

variable "root_domain" {
  description = "Root Domain"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "The VPC ID"
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
  type        = string
  default     = "10.0.1.0/20"
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}

variable "web_is_public" {
  description = "Web Instance Subnet (true: public / flase: private)"
  type        = bool
  default     = false
}