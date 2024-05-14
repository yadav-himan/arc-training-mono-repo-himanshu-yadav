variable "aws_region" {
  default = "us-east-1"
}

variable "identifier" {
  description = "Identifier for the RDS instance"
}

variable "allocated_storage" {
  description = "Allocated storage for the RDS instance"
}

variable "engine" {
  description = "Database engine type for the RDS instance"
}

variable "engine_version" {
  description = "Database engine version for the RDS instance"
}

variable "instance_class" {
  description = "Instance class for the RDS instance"
}

variable "username" {
  description = "Username for the RDS instance"
}

variable "password" {
  description = "Password for the RDS instance"
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group"
}

variable "security_group_id" {
  description = "Security group ID"
}
