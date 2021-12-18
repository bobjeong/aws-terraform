resource "aws_route_table" "tier-pub-rt" {
  vpc_id = aws_vpc.tier_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tier_igw.id
  }

  tags = {
    Name = "${var.cluster_name}-pub-rt"
  }
}

resource "aws_route_table_association" "pub-1" {
  subnet_id = aws_subnet.tier_public_subnet_1.id
  route_table_id = aws_route_table.tier-pub-rt.id
}

resource "aws_route_table_association" "pub-2" {
  subnet_id = aws_subnet.tier_public_subnet_2.id
  route_table_id = aws_route_table.tier-pub-rt.id
}

resource "aws_route_table" "tier_prv_rt" {
  vpc_id = aws_vpc.tier_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.tier_nat.id
  }
  tags = {
    Name = "${var.cluster_name}-prv-web-rt"
  }
}

resource "aws_route_table_association" "prv-1" {
  subnet_id = aws_subnet.web_private_subnet_1.id
  route_table_id = aws_route_table.tier_prv_rt.id
}

resource "aws_route_table_association" "prv-2" {
  subnet_id = aws_subnet.web_private_subnet_2.id
  route_table_id = aws_route_table.tier_prv_rt.id
}


resource "aws_route_table" "was_prv_rt" {
  vpc_id = aws_vpc.tier_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.tier_nat.id
  }
  tags = {
    Name = "${var.cluster_name}-prv-was-rt"
  }
}

resource "aws_route_table_association" "prv_3" {
  subnet_id = aws_subnet.was_private_subnet_1.id
  route_table_id = aws_route_table.was_prv_rt.id
}

resource "aws_route_table_association" "prv_4" {
  subnet_id = aws_subnet.was_private_subnet_1.id
  route_table_id = aws_route_table.was_prv_rt.id
}

resource "aws_route_table_association" "db_1" {
  subnet_id = aws_subnet.db_subnet_1.id
  route_table_id = aws_route_table.was_prv_rt.id
}

resource "aws_route_table_association" "db_2" {
  subnet_id = aws_subnet.db_subnet_2.id
  route_table_id = aws_route_table.was_prv_rt.id
}