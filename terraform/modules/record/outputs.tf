output "domain_record_name" {
  description = "Name of DNS record"
  value       = linode_domain_records.domain_records[*].name
}

output "domain_record_target" {
  description = "Target of DNS record"
  value       = linode_domain_records.domain_records[*].target
}

output "domain_record_record_type" {
  description = "Record type of DNS record"
  value       = linode_domain_records.domain_records[*].record_type
}

output "domain_record_domain_id" {
  description = "Domain ID of DNS record"
  value       = linode_domain_records.domain_records[*].domain_id
}
