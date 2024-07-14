################################################################################
## imports
################################################################################
data "aws_caller_identity" "this" {}

## network
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["himanhsu-arc-vpc"]
  }
}

data "aws_subnets" "private" {
  filter {
    name = "tag:Name"

    values = [
      " himanshu-arc-us-east-*"
    ]
  }
}


# Workaround for bucket policy update
# 2 Cloudfront distrubutions use same bucket as origin
data "aws_s3_bucket" "dealer" {
  bucket = "arc-iac-poc-vyshsf"
}
