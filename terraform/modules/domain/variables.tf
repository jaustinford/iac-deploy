variable "domain_soa_email" {
  description = "Start-of-Authority email for DNS domain"
  type        = string
}

variable "domain_domain" {
  description = "Name of DNS domain"
  type        = string
}

variable "domain_ttl_sec" {
  description = "Time-to-live for DNS records in seconds"
  type        = number
  default     = 300
}

variable "domain_labels" {
  description = "Create A records for the IP addresses of Linode labels"
  type        = list(string)
}

variable "domain_alias_records" {
  description = "Create CNAME records as input variables"
  type        = list(
    object(
      {
        name   = string
        target = string
      }
    )
  )
}
