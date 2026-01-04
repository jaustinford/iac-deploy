variable "tag_ci_pipeline_id" {
  type        = string
  description = "Tag for CI_PIPELINE_ID"
  default     = "deployed locally"
}

variable "vault_token" {
  type        = bool
  description = "Provide Linode token at runtime"
  default     = true
}

variable "vault_addr" {
  type        = string
  description = "Address for Vault"
}
