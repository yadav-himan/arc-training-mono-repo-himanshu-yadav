################################################################################
## defaults
################################################################################
terraform {
  required_version = "~> 1.3"

  required_providers {
    aws = {
      version = "~> 4.0"
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {}
}

module "tags" {
  source = "git::https://github.com/sourcefuse/terraform-aws-refarch-tags?ref=1.2.1"

  environment = var.environment
  project     = var.project_name

  extra_tags = {
    MonoRepo     = "True"
    MonoRepoPath = "terraform/resources/db"
  }
}

################################################################################
## CloudFront
################################################################################
module "cloudfront" {
  source = "git::https://github.com/sourcefuse/terraform-aws-refarch-cloudfront?ref=3.0.0"

  for_each = {
    for index, distribution in local.arc-training[var.environment] :
    distribution.id => distribution
  }

  origins                = each.value.origins
  namespace              = each.value.namespace
  description            = each.value.description
  default_root_object    = each.value.default_root_object
  route53_root_domain    = each.value.route53_root_domain
  create_route53_records = each.value.create_route53_records
  aliases                = each.value.aliases
  enable_logging         = each.value.enable_logging

  default_cache_behavior  = each.value.default_cache_behavior
  viewer_certificate      = each.value.viewer_certificate
  cache_behaviors         = each.value.cache_behaviors
  origin_request_policies = each.value.origin_request_policies
  cache_policies          = each.value.cache_policies

  acm_details            = each.value.acm_details
  custom_error_responses = each.value.custom_error_responses
  s3_kms_details         = each.value.s3_kms_details
  price_class            = each.value.price_class

  tags = module.tags.tags
}

data "aws_route53_zone" "this" {
  name         = var.route53_root_domain
  private_zone = false
}

resource "aws_route53_record" "dev" {
  for_each = toset(var.route53_cname_records[var.route53_root_domain])
  zone_id  = data.aws_route53_zone.this.zone_id
  name     = each.value
  type     = "CNAME"
  ttl      = "300"
  records  = [var.route53_root_domain]
}
