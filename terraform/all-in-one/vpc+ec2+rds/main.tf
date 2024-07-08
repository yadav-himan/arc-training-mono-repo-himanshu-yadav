module network {
  source = "../../../modules/network"
  vpc_name = var.vpc_name
 
}

module ec2 {
  source = "../../../modules/ec2"
  depends_on    = [module.network]
  
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  depends_on    = [module.network]
  name       = var.db_subnet_group_name
  subnet_ids = [module.network.subnet_id[0], module.network.subnet_id[1]]
}
module "rds" {
  source = "../../../modules/rds"
  depends_on    = [module.ec2]
  instance_class = var.instance_class
  identifier = var.identifier
  allocated_storage = var.allocated_storage
  engine_version = var.engine_version
  username = var.username
  engine = var.engine
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.id
  parameter_group_name = var.parameter_group_name
}