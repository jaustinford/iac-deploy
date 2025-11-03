###########################################################
# module
###########################################################

variable "firewall_label" {
  type        = string
  description = "Label of firewall"
}

variable "firewall_linodes" {
  type        = list(string)
  description = "List of applied Linodes"
}

variable "firewall_disabled" {
  type        = bool
  description = "Should firewall be disabled"
  default     = false
}

variable "firewall_inbound" {
  type = list(
    object(
      {
        action   = string
        protocol = string
        label    = string
        ports    = string
        ipv4     = list(string)
      }
    )
  )

  description = "Inbound rules for firewall"
}

variable "firewall_inbound_policy" {
  type        = string
  description = "Firewall Inbound Policy"
  default     = "DROP"
}

variable "firewall_outbound_policy" {
  type        = string
  description = "Firewall Outbound Policy"
  default     = "ACCEPT"
}

###########################################################
# tags
###########################################################

variable "tag_ci_pipeline_id" {
  type        = string
  description = "Tag for CI_PIPELINE_ID"
}
