output "root_password_id" {
  description = "Root password ID"
  value       = random_password.root_password.*.result
  sensitive   = true
}

output "instance_id" {
  description = "Instance ID"
  value       = linode_instance.instance.*.id
}

output "instance_ip_address" {
  description = "Instance IP address"
  value       = linode_instance.instance.*.ip_address
}
