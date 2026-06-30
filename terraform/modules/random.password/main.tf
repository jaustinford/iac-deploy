##################################################
# module
##################################################

resource "random_password" "password" {
  length  = var.password_length
  numeric = var.password_numeric
  special = var.password_special
  lower   = var.password_lower
  upper   = var.password_upper

  override_special = var.password_override_special
}
