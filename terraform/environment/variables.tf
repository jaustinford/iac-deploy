variable "tag_ci_pipeline_id" {
  type        = string
  description = "Tag for CI_PIPELINE_ID"
  default     = "deployed locally"
}

variable "linode_token" {
  type        = string
  description = "Provide Linode token at runtime"
  default     = ""
}

variable "vault_addr" {
  type        = string
  description = "Address for Vault"
}
