module "ec2_bastion" {
  source  = "./common/terraform-aws-ec2-instance"

  name                   = local.bastion_name
  ami                    = data.aws_ami.amazon_linux2.id
  instance_type          = var.bastion_instance_type
  key_name               = var.bastion_key_pair_name
  monitoring             = true
  vpc_security_group_ids = [module.security_group_bastion.security_group_id]
  subnet_id              = aws_subnet.tier_public_subnet_1.id
  iam_instance_profile   = aws_iam_instance_profile.bastion_instance_profile.name

  tags = {
    bastion = true
  }
}

resource "aws_iam_instance_profile" "bastion_instance_profile" {
  name = "${var.bastion_instance_name}-profile"
  role = aws_iam_role.bastion_instance_role.name
}

resource "aws_iam_role" "bastion_instance_role" {
  name = "${var.bastion_instance_name}-role"
  path = "/"

  assume_role_policy = var.bastion_instance_role_policy
}
