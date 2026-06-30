output "domain_id" {
  description = "Domain ID"
  value       = linode_domain.domain.id
}

output "domain_status" {
  description = "Domain status"
  value       = linode_domain.domain.status
}
