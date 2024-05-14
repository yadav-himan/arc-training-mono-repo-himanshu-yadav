resource "aws_db_instance" "rds_instance" {
  identifier             = var.identifier
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.username
  password               = var.password
  db_subnet_group_name   = var.db_subnet_group_name
  parameter_group_name   = var.parameter_group_name
  vpc_security_group_ids = [var.security_group_id]
  skip_final_snapshot    = true

}

/* resource "aws_db_subnet_group" "subnet-group-1" {
  name       = "xyz"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name = "Education"
  }
}

resource "aws_db_parameter_group" "parameter_group" {
  name   = "abc"
  family = "postgres14"

  parameter {
    name  = "log_connections"
    value = "1"
  }
} */
