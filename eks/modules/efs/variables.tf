# variable

variable "name" {
  description = "Name to be used on all resources as prefix"
  default = ""
}

variable "vpc_id" {
  description = "The VPC ID."
  default = ""
}

variable "subnet_ids" {
  description = "List of Subnet Ids"
  type = list(string)
  default = []
}

variable "mount_target_sg" {
  description = "Security Group ID for mount target"
  type = list(string)
  default = []
}