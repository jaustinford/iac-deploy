output "instance_root_password" {
  value     = random_string.root_password.id
  sensitive = true
}

output "instance_ip" {
  value = linode_instance.instance.ip_address
}
