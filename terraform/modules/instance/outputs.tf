output "root_password_id" {
  value     = random_password.root_password.result
  sensitive = true
}

output "instance_id" {
  value = linode_instance.instance.id
}

output "instance_ip_address" {
  value = linode_instance.instance.ip_address
}
