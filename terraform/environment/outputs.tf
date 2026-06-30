output "domain_lab_domain_status" {
  description = "Lab domain status"
  value       = module.domain_lab.domain_status
}

output "tls_nginx_certificate_certificate_pem" {
  description = "Nginx certificate PEM"
  value       = module.tls_nginx.certificate_certificate_pem
}

output "instance_portal_instance_id" {
  description = "Portal instance ID"
  value       = module.instance_portal.instance_id
}

output "instance_portal_instance_label" {
  description = "Portal instance Label"
  value       = module.instance_portal.instance_label
}

output "instance_portal_ip_address" {
  description = "Portal instance IP address"
  value       = module.instance_portal.instance_ip_address
}

output "instance_portal_boot_disk_encryption" {
  description = "Instance boot disk encryption enabled"
  value       = module.instance_portal.instance_disk_boot_disk_encryption
}

output "firewall_portal_firewall_id" {
  description = "Lab firewall ID"
  value       = module.firewall_portal.firewall_id
}

output "firewall_portal_firewall_status" {
  description = "Lab firewall status"
  value       = module.firewall_portal.firewall_status
}
