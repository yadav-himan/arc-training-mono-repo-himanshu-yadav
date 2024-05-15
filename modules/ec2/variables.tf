variable "aws_region" {
  description = "The region in AWS where you want to deploy resources"
  type = string
  default = "us-east-1"
}

variable "name" {
  description = "Name of the EC2 instance"
  type = string
  default = "arc-ec2"
}

variable "ami" {
  description = "AMI through which the EC2 will be launched"
  type = string
  default = "ami-07caf09b362be10b8"
}

variable "instance_type" {
  description = "The EC2 instance type"
  type = string
  default = "t2.micro"
}

variable "key_name" {
  description = "The private key that should be used to connect to EC2"
  type = string
  default = "arc-ec2"
}

variable "subnet_id" {
  description = "The subnet in which the EC2 should be launched"
  type = string
  default = "subnet-0404584ceeb699afb"
}

variable "security_group_id" {
  description = "The security group to be attached to EC2"
  type = string
  default = "sg-0b248382bda490ff7"
}

variable "key_pair" {
  type    = string
  default = "himanshu_arc-ec2"
}