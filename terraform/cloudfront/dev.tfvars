environment  = "poc"
namespace    = "arc-himanshu"
region       = "us-east-1"
project_name = "arc-training"

// Rest of the values are in local.tf
route53_root_domain = "divyasf.sourcef.us"
route53_cname_records = {
  "divyasf.sourcef.us" = [
    "poc.divyasf.sourcef.us"
  ]
}
