##################################################
# module
##################################################

variable "generic_secret_path" {
  type        = string
  description = "Name of Vault Generic Secret path"
}

variable "generic_secret_data_json" {
  type        = map(string)
  description = "Object containing Vault Generic Secret data"
}
