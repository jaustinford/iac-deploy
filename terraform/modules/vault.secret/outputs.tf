output "vault_data" {
  description = "Data containing Vault Generic Secret"
  value       = vault_generic_secret.generic_secret.data
  sensitive   = true
}
