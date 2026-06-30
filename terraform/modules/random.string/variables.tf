##################################################
# module
##################################################

variable "string_length" {
  description = "Length of string"
  type        = number
  default     = 10
}

variable "string_numeric" {
  description = "Should numeric characters be used"
  type        = bool
  default     = true
}

variable "string_special" {
  description = "Should special characters be used"
  type        = bool
  default     = false
}

variable "string_lower" {
  description = "Should lower case characters be used"
  type        = bool
  default     = true
}

variable "string_upper" {
  description = "Should upper case characters be used"
  type        = bool
  default     = false
}
