
################################################################
## shared
################################################################
variable "project_name" {
  type        = string
  description = "Name of the project."
}
 
variable "region" {
  type        = string
  default     = "us-east-2"
  description = "AWS region"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT'"
}

variable "namespace" {
  type        = string
  description = "Namespace for the resources."
  default     = "poc"
}

variable "route53_root_domain" {
  type        = string
  description = "Route53 root domain"
}

variable "route53_cname_records" {
  type        = map(any)
  description = "Route53 records to be created"
  default     = {}
}
