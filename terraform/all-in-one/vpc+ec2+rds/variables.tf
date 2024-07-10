variable "aws_region" {
  description = "The region in AWS where you want to deploy resources"
  type = string
  default = "us-east-1"
}

# variable "vpc_cidr_block" {
#   description = "The CIDR block for the VPC"
#   type        = string
# }

# variable "public_subnet_cidr_blocks" {
#   description = "List of CIDR blocks for the public subnets"
#   type        = list(string)
# }

# variable "private_subnet_cidr_blocks" {
#   description = "List of CIDR blocks for the private subnets"
#   type        = list(string)
# }

# variable "availability_zones" {
#   description = "List of availability zones"
#   type        = list(string)
# }

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

# variable "vpc_tags" {
#   description = "Tags for the VPC"
#   type        = map(string)
# }

# variable "environment" {
#   default = "himanshu-arc"
# }

# variable "name" {
#   default = "himanshu-arc-ec2"
  
# }

# variable "key_name" {
#   default ="himanshu_arc-ec2.pem"
  
# }

# variable "security_group_name" {
#   description = "Name of the security group"
#   type        = string
#   default     = "instance_security_group"
# }

# variable "security_group_description" {
#   description = "Description of the security group"
#   type        = string
#   default     = "Security group for the EC2 instance"
# }

# variable "ingress_rules" {
#   description = "A map of ingress rules"
#   type = map(object({
#     description = string
#     from_port   = number
#     to_port     = number
#     protocol    = string
#     cidr_blocks = list(string)
#   }))
#   default = {
#     ssh = {
#       description = "SSH Port allowed for all"
#       from_port   = 22
#       to_port     = 22
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#     # Add more ingress rules as needed
#   }
# }

# variable "egress_rules" {
#   description = "A map of egress rules"
#   type = map(object({
#     description = string
#     from_port   = number
#     to_port     = number
#     protocol    = string
#     cidr_blocks = list(string)
#   }))
#   default = {
#     all_traffic = {
#       description = "All outbound traffic allowed"
#       from_port   = 0
#       to_port     = 0
#       protocol    = "-1"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#     # Add more egress rules as needed
#   }
# }

variable "identifier" {
  description = "Identifier for the RDS instance"
  type = string
}

variable "allocated_storage" {
  description = "Allocated storage for the RDS instance"
  type = number
}

variable "engine" {
  description = "Database engine type for the RDS instance"
  type = string

}

variable "engine_version" {
  description = "Database engine version for the RDS instance"
  type = string
}

variable "instance_class" {
  description = "Instance class for the RDS instance"
  type = string
}

variable "username" {
  description = "Username for the RDS instance"
  type = string
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group"
  type = string
}
variable "db_subnet_group_name" {
  description = "RDS subnet group name"
  type = string
}