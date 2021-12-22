variable "region" {
  default = "ap-northeast-2"
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

# VPC
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
  type        = string
  default     = "10.0.1.0/20"
}

variable "public_subnet_count" {
  description = "Public Subnet Count (default: 2)"
  type        = number
  default     = 2
}