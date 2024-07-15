module network {
  source = "../../../modules/network"
  environment = "himanshu-arc"
  vpc_name = "himanhsu-arc-vpc"
  vpc_cidr = "10.0.0.0/16"
  public_subnets_cidr = ["10.0.0.0/20", "10.0.128.0/20"]
  private_subnets_cidr = ["10.0.16.0/20", "10.0.144.0/20"]

 
}

module ec2 {
  source = "../../../modules/ec2"
  name              = "himanshu-arc-ec2"
  ami               = "ami-04b70fa74e45c3917"
  instance_type     = "t2.micro"
  key_pair = "himanshu_arc-ec2"
  
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  depends_on    = [module.network]
  name       = var.db_subnet_group_name
  subnet_ids = [module.network.subnet_id[0], module.network.subnet_id[1]]
}
module "rds" {
  source = "../../../modules/rds"
  instance_class = var.instance_class
  identifier = var.identifier
  allocated_storage = var.allocated_storage
  engine_version = var.engine_version
  username = var.username
  engine = var.engine
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.id
  parameter_group_name = var.parameter_group_name
}