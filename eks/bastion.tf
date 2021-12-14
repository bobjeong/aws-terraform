module "ec2_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name                   = var.bastion_instance_name
  ami                    = var.bastion_ami
  instance_type          = var.bastion_instance_type
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = [module.security_group_bastion.security_group_id]
  subnet_id              = "${element(module.vpc.public_subnets, 0)}"
  iam_instance_profile   = aws_iam_instance_profile.bastion_instance_profile.name

  tags = {
    bastion = true
  }
}

resource "aws_iam_instance_profile" "bastion_instance_profile" {
  name = "${var.bastion_instance_name}-bastion_profile"
  role = aws_iam_role.bastion_instance_role.name
}

resource "aws_iam_role" "bastion_instance_role" {
  name = "${var.bastion_instance_name}-bastion_role"
  path = "/"

  assume_role_policy = var.bastion_instance_role_policy
}