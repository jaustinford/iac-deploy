output "firewall_id" {
  value = linode_firewall.firewall.id
}

output "firewall_status" {
  value = linode_firewall.firewall.status
}

output "firewall_devices" {
  value = linode_firewall.firewall.devices
}
