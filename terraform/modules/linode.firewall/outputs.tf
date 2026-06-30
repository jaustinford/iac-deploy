output "firewall_id" {
  description = "Firewall ID"
  value       = linode_firewall.firewall.id
}

output "firewall_status" {
  description = "Firewall status"
  value       = linode_firewall.firewall.status
}

output "firewall_devices" {
  description = "Firewall devices"
  value       = linode_firewall.firewall.devices
}
