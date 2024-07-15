locals {
  arc-training = {
    "poc" = [
      {
        id = "arc-training-himanshu",
        origins = [{
          origin_type   = "s3",
          origin_id     = "arc-training-himanshu",
          domain_name   = "",
          bucket_name   = "arc-iac-poc-himanshu",
          create_bucket = true
          }
        ],
        namespace              = var.namespace,
        description            = "",
        default_root_object    = "index.html"
        route53_root_domain    = var.route53_root_domain, // Used to fetch the Hosted Zone
        create_route53_records = true,
        aliases                = ["divyasf.sourcef.us", "*.divyasf.sourcef.us"],
        enable_logging         = false,

        default_cache_behavior = {
          origin_id              = "arc-training-himanshu"
          allowed_methods        = ["GET", "HEAD"]
          cached_methods         = ["GET", "HEAD"]
          compress               = false
          viewer_protocol_policy = "redirect-to-https"

          use_aws_managed_cache_policy          = true
          cache_policy_name                     = "CachingOptimized"
          use_aws_managed_origin_request_policy = true
          origin_request_policy_name            = "CORS-S3Origin"
        },
        origin_request_policies = {},
        cache_policies          = {},
        viewer_certificate = {
          cloudfront_default_certificate = false // false :  It will create ACM certificate with details provided in acm_details
          minimum_protocol_version       = "TLSv1.2_2018"
          ssl_support_method             = "sni-only"
        },
        cache_behaviors = [],

        acm_details = {
          domain_name               = "*.divyasf.sourcef.us",
          subject_alternative_names = ["divyasf.sourcef.us"]
        },
        custom_error_responses = [{
          error_caching_min_ttl = 10,
          error_code            = "403",
          response_code         = "200",
          response_page_path    = "/index.html"
          },
          {
            error_caching_min_ttl = 10,
            error_code            = "404",
            response_code         = "200",
            response_page_path    = "/index.html"
        }],
        s3_kms_details = {
          s3_bucket_encryption_type = "SSE-S3", //Encryption for S3 bucket , options : `SSE-S3` , `SSE-KMS`
          kms_key_administrators    = [],
          kms_key_users             = [], // Note :- Add users/roles who wanted to read/write to S3 bucket
          kms_key_arn               = null
        },
        price_class = "PriceClass_All"
      }
    ],
  }
}
