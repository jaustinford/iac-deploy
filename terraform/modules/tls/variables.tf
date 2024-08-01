variable "private_key_rsa_bits" {
  description = "Bit size of RSA key"
  type        = number
  default     = 2048
}

variable "registration_email_address" {
  description = "Email to register with certificate"
  type        = string
}

variable "certificate_common_name" {
  description = "Common Name for subject"
  type        = string
}

variable "certificate_subject_alternative_names" {
  description = "Subject Alternative Names"
  type        = list(string)
}

variable "certificate_min_days_remaining" {
  description = "Minimum number of days until renewal is attempted"
  type        = number
  default     = 30
}
