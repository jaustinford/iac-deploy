###########################################################
# module
###########################################################

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

variable "records_domain_id" {
  type        = string
  description = "ID for domain"
}
