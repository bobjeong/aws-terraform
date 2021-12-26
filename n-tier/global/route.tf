resource "aws_route_table" "public" {
  vpc_id = aws_vpc.tier_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = format("%s-%s",var.cluster_name, "public")
  }
}

resource "aws_route_table_association" "public" {
  count = local.public_subnet_count

  subnet_id      = element(local.public_subnet_ids, count.index)
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table" "private" {
  count = (local.private_subnet_count / 2) + (local.private_subnet_count % 2)

  vpc_id = aws_vpc.tier_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = {
    Name = format("%s-%s",var.cluster_name, "private-${count.index}")
  }
}

resource "aws_route_table_association" "private" {
  count = local.private_subnet_count

  subnet_id      = element(local.private_subnet_ids, count.index)
  route_table_id = element(aws_route_table.private.*.id, floor(count.index / 2))
//  coalescelist
}