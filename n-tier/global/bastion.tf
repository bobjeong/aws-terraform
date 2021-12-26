module "security_group_bastion" {
  source = "terraform-aws-modules/security-group/aws"
  vpc_id = aws_vpc.tier_vpc.id
  name   = local.bastion_sg_name

  ingress_cidr_blocks = var.bastion_ingress_cidr_blocks
  ingress_rules       = var.bastion_ingress_rule
  egress_rules        = var.bastion_egress_rule
}

module "ec2_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name                   = local.bastion_name
  ami                    = var.bastion_ami
  instance_type          = var.bastion_instance_type
  key_name               = var.bastion_key_pair_name
  monitoring             = true
  vpc_security_group_ids = [module.security_group_bastion.security_group_id]
  subnet_id              = aws_subnet.public[0].id
  iam_instance_profile   = aws_iam_instance_profile.bastion_instance_profile.name

  tags = {
    bastion = true
  }
}

resource "aws_iam_instance_profile" "bastion_instance_profile" {
  name = local.bastion_profile_name
  role = aws_iam_role.bastion_instance_role.name
}

resource "aws_iam_role" "bastion_instance_role" {
  name = local.bastion_role_name
  path = "/"

  assume_role_policy = var.bastion_instance_role_policy
}