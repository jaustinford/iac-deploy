##################################################
# module
##################################################

resource "random_string" "string" {
  length  = var.string_length
  numeric = var.string_numeric
  special = var.string_special
  lower   = var.string_lower
  upper   = var.string_upper
}
