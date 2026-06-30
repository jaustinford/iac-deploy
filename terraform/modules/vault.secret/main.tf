##################################################
# module
##################################################

resource "vault_generic_secret" "generic_secret" {
  path      = "lab/kv/${var.generic_secret_path}"
  data_json = jsonencode(var.generic_secret_data_json)
}
