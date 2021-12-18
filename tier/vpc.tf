resource "aws_vpc" "tier_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.cluster_name}-vpc"
  }
}

resource "aws_subnet" "tier_public_subnet_1" {
  vpc_id = aws_vpc.tier_vpc.id
  cidr_block = cidrsubnet(var.subnet_cidr, 4, 1)
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch=true
  tags = {
    Name = "${var.cluster_name}-pub-1"
  }
}

resource "aws_subnet" "tier_public_subnet_2" {
  vpc_id = aws_vpc.tier_vpc.id
  cidr_block = cidrsubnet(var.subnet_cidr, 4, 2)
  availability_zone = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch=true
  tags = {
    Name = "${var.cluster_name}-pub-2"
  }
}

resource "aws_subnet" "web_private_subnet_1" {
  vpc_id = aws_vpc.tier_vpc.id
  cidr_block = cidrsubnet(var.subnet_cidr, 4, 3)
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "${var.cluster_name}-prv-web-1"
  }
}

resource "aws_subnet" "web_private_subnet_2" {
  vpc_id = aws_vpc.tier_vpc.id
  cidr_block = cidrsubnet(var.subnet_cidr, 4, 4)
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "${var.cluster_name}-prv-web-2"
  }
}

resource "aws_subnet" "was_private_subnet_1" {
  vpc_id = aws_vpc.tier_vpc.id
  cidr_block = cidrsubnet(var.subnet_cidr, 4, 5)
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "${var.cluster_name}-prv-was-1"
  }
}

resource "aws_subnet" "was_private_subnet_2" {
  vpc_id = aws_vpc.tier_vpc.id
  cidr_block = cidrsubnet(var.subnet_cidr, 4, 6)
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "${var.cluster_name}-prv-was-2"
  }
}

resource "aws_subnet" "db_subnet_1" {
  vpc_id = aws_vpc.tier_vpc.id
  cidr_block = cidrsubnet(var.subnet_cidr, 4, 7)
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "${var.cluster_name}-prv-db-1"
  }
}

resource "aws_subnet" "db_subnet_2" {
  vpc_id = aws_vpc.tier_vpc.id
  cidr_block = cidrsubnet(var.subnet_cidr, 4, 8)
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "${var.cluster_name}-prv-db-2"
  }
}