##################################################
# module
##################################################

variable "password_length" {
  description = "Length of password"
  type        = number
  default     = 20
}

variable "password_numeric" {
  description = "Should numeric characters be used"
  type        = bool
  default     = true
}

variable "password_special" {
  description = "Should special characters be used"
  type        = bool
  default     = true
}

variable "password_lower" {
  description = "Should lower case characters be used"
  type        = bool
  default     = true
}

variable "password_upper" {
  description = "Should upper case characters be used"
  type        = bool
  default     = true
}

variable "password_override_special" {
  description = "Only use these special characters"
  type        = string
  default     = "!#$%*()-_=+[]{}:?"
}
