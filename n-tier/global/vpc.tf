resource "aws_vpc" "tier_vpc" {

  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.cluster_name}-VPC"
  }
}
