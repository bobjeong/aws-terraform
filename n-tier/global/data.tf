data aws_subnet_ids "public" {
  vpc_id = aws_vpc.tier_vpc.id

  tags = {
    Type = "public"
  }

  depends_on = [aws_vpc.tier_vpc, aws_subnet.public]
}

//data "aws_subnet" "public" {
//  for_each = data.aws_subnet_ids.public.ids
//  id       = each.value
//
//  depends_on = [aws_vpc.tier_vpc, aws_subnet.public]
//}


data aws_subnet_ids "private" {
  vpc_id = aws_vpc.tier_vpc.id

  tags = {
    Type = "private"
  }

  depends_on = [aws_vpc.tier_vpc, aws_subnet.private]
}

//data "aws_subnet" "private" {
//  for_each = data.aws_subnet_ids.private.ids
//  id       = each.value
//
//  depends_on = [aws_vpc.tier_vpc, aws_subnet.private]
//}
