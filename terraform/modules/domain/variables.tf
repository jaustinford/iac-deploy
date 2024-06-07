variable "linode_token" {
  type = string
}

variable "instance_labels" {
  type = list(string)
}

variable "domain_soa_email" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "domain_dns_ttl" {
  type = string
}

variable "domain_records" {
  type = list(
    object (
      {
        name        = string
        record_type = string
        target      = string
      }
    )
  )
}
