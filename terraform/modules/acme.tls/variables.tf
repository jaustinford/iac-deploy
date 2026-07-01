##################################################
# module
##################################################

variable "private_key_rsa_bits" {
  type        = number
  description = "Bit size of RSA key"
  default     = 2048
}

variable "registration_email_address" {
  type        = string
  description = "Email to register with certificate"
}

variable "certificate_common_name" {
  type        = string
  description = "Common Name for subject"
}

variable "certificate_subject_alternative_names" {
  type        = list(string)
  description = "Subject Alternative Names"
}

variable "certificate_min_days_remaining" {
  type        = number
  description = "Minimum number of days until renewal is attempted"
  default     = 30
}

variable "certificate_pre_check_delay" {
  type        = number
  description = "Number of seconds to wait until DNS check"
  default     = 30
}
