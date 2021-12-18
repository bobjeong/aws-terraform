resource "aws_eip" "tier_eip" {
  vpc = true
  tags = {
    Name = "${var.cluster_name}-eip"
  }
}

resource "aws_nat_gateway" "tier_nat" {
  allocation_id = aws_eip.tier_eip.id
  subnet_id = aws_subnet.tier_public_subnet_2.id
  tags = {
    Name = "${var.cluster_name}-nat-gateway"
  }
}