resource "aws_eip" "this" {
  vpc = true

  tags = {
    Name = local.public_nat_eip_name
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id = aws_subnet.public[(length(aws_subnet.public) - 1)].id

  tags = {
    Name = local.public_nat_name
  }
}