data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public" {
  count = length(local.public_subnets) > 0 ?  length(local.public_subnets) : 0

  vpc_id                  = aws_vpc.tier_vpc.id
  cidr_block              = element(concat(local.public_subnets, [""]), count.index)
  availability_zone       = length(regexall("^[a-z]{2}-", element(var.azs, count.index))) > 0 ? element(var.azs, count.index) : null
  map_public_ip_on_launch = true

  tags = {
    Name = "${local.public_subnet_name}-${count.index+1}"
    Type = "public"
  }
}

resource "aws_subnet" "private" {
  count = length(local.private_subnets) > 0 ?  length(local.private_subnets) : 0

  vpc_id                  = aws_vpc.tier_vpc.id
  cidr_block              = element(concat(local.private_subnets, [""]), count.index)
  availability_zone       = length(regexall("^[a-z]{2}-", element(var.azs, count.index))) > 0 ? element(var.azs, count.index) : null

  tags = {
    Name = "${local.private_subnet_name}-${count.index+1}"
    Type = "private"
  }
}
