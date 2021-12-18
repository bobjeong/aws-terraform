resource "aws_db_instance" "tier-db-instance" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.default.id
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_engine_instance_class
  multi_az               = true
  name                   = local.db_name
  username               = var.db_user_name
  password               = var.db_user_pass
  skip_final_snapshot    = true
  vpc_security_group_ids = [module.security_group_rds.security_group_id]
}

resource "aws_db_subnet_group" "default" {
  name       = "tier-db-subnet-group"
  subnet_ids = [aws_subnet.db_subnet_1.id, aws_subnet.db_subnet_2.id]
}