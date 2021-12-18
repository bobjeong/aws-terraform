resource "aws_internet_gateway" "tier_igw" {
  vpc_id = aws_vpc.tier_vpc.id

  tags = {
    Name = "${var.cluster_name}-igw"
  }
}