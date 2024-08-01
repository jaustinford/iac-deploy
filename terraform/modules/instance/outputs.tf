output "root_password_id" {
  description = "root_password_id"
  value       = random_password.root_password.result
  sensitive   = true
}

output "instance_ip_address" {
  description = "instance_ip_address"
  value       = linode_instance.instance.ip_address
}

output "firewall_id" {
  description = "firewall_id"
  value       = linode_firewall.firewall.id
}
