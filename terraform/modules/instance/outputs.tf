output "root_password_id" {
  description = "Root password ID"
  value       = random_password.root_password[*].result
  sensitive   = true
}

output "instance_id" {
  description = "Instance ID"
  value       = linode_instance.instance[*].id
}

output "instance_label" {
  description = "Instance Label"
  value       = linode_instance.instance[*].label
}

output "instance_ip_address" {
  description = "Instance IP address"
  value       = linode_instance.instance[*].ip_address
}

output "instance_disk_boot_disk_encryption" {
  description = "Instance disk boot disk encryption"
  value       = linode_instance_disk.boot_disk[*].disk_encryption
}
