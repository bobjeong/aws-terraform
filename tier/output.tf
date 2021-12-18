# VPC
output "vpc_id" {
  value = aws_vpc.tier_vpc.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value = aws_vpc.tier_vpc.cidr_block
}

output "public_subnet_1_ip" {
  value = aws_subnet.tier_public_subnet_1.id
}

output "public_subnet_1_cidr_block" {
  value = aws_subnet.tier_public_subnet_1.cidr_block
}

output "public_subnet_2_ip" {
  value = aws_subnet.tier_public_subnet_2.id
}

output "public_subnet_2_cidr_block" {
  value = aws_subnet.tier_public_subnet_2.cidr_block
}

output "web_subnet_1_ip" {
  value = aws_subnet.web_private_subnet_1.id
}

output "web_subnet_1_cidr_block" {
  value = aws_subnet.web_private_subnet_1.cidr_block
}

output "web_subnet_2_ip" {
  value = aws_subnet.web_private_subnet_2.id
}

output "web_subnet_2_cidr_block" {
  value = aws_subnet.web_private_subnet_2.cidr_block
}

output "was_subnet_1_ip" {
  value = aws_subnet.was_private_subnet_1.id
}

output "was_subnet_1_cidr_block" {
  value = aws_subnet.was_private_subnet_1.cidr_block
}

output "was_subnet_2_ip" {
  value = aws_subnet.was_private_subnet_2.id
}

output "was_subnet_2_cidr_block" {
  value = aws_subnet.was_private_subnet_2.cidr_block
}

output "web_alb_dns_name" {
  value = aws_lb.web_alb.dns_name
}

output "web_alb_zone_id" {
  value = aws_lb.web_alb.zone_id
}

output "was_alb_dns_name" {
  value = aws_lb.was_alb.dns_name
}

output "was_alb_zone_id" {
  value = aws_lb.was_alb.zone_id
}

//output "web_zone_name" {
//  value = aws_lb.web_alb.dns_name
//}
//
//output "web_zone_id" {
//  value = aws_lb.web_alb.zone_id
//}