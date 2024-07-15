region                       = "us-east-1"
project_name                 = "arc-iac"
environment                  = "dev"
allow_encrypted_uploads_only = false
user_enabled                 = false

s3_buckets = [

  {
    bucket_name                   = "arc-iac-poc-vyshsf" // Bucket is origin for CloudFront
    bucket_key_enabled            = false
    allowed_bucket_actions        = []
    acl                           = "private"
    force_destroy                 = true
    block_public_acls             = false
    versioning_enabled            = false
    lifecycle_configuration_rules = []
    website_configuration         = []
    cors_configuration            = []

    access_key_enabled = false
  },
]
website_configuration = []
access_key_enabled    = true

