variable "aws_region" {
  default = "us-east-1"
}

variable "name" {
  default = "arc-ec2"
}

variable "ami" {
  default = "ami-07caf09b362be10b8"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "arc-ec2"
}

variable "subnet_id" {
  default = "subnet-0404584ceeb699afb"
}

variable "security_group_id" {
  default = "sg-0b248382bda490ff7"
}

