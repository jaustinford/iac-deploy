variable "instance_labels" {
  description = "Attach labels to Linode resource"
  type        = list(string)
}

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

variable "domain_records" {
  description = "list of DNS records for domain"
  type        = list(
    object(
      {
        name        = string
        record_type = string
        target      = string
      }
    )
  )
}
