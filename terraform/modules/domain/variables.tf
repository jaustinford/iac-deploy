###########################################################
# module
###########################################################

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

variable "domain_records" {
  type = list(
    object(
      {
        record_type = string
        name        = string
        target      = string
      }
    )
  )

  description = "List of domain records"
}

###########################################################
# tags
###########################################################

variable "tag_ci_pipeline_id" {
  type        = string
  description = "Tag for CI_PIPELINE_ID"
}
