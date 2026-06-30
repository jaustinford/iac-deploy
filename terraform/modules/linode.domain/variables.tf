##################################################
# module
##################################################

variable "domain_ttl_sec" {
  type        = number
  description = "Time-to-live for DNS records in seconds"
  default     = 300
}

variable "domain_domain" {
  type        = string
  description = "Name of DNS domain"
}

variable "domain_soa_email" {
  type        = string
  description = "Start-of-Authority email for DNS domain"
}

variable "tag_ci_pipeline_id" {
  type        = string
  description = "Tag for CI_PIPELINE_ID"
}
