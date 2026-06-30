variable "tag_ci_pipeline_id" {
  type        = string
  description = "Tag for CI_PIPELINE_ID"
  default     = "deployed locally"
}

variable "vault_enabled" {
  type        = bool
  description = "Should Vault be used"
}
