output "vpc_lab_vpc_id" {
  description = "Lab VPC ID"
  value       = module.vpc_lab.vpc_id
}

output "vpc_lab_vpc_subnet_id" {
  description = "Lab VPC subnet ID"
  value       = module.vpc_lab.vpc_subnet_id
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

output "firewall_lab_firewall_id" {
  description = "Lab firewall ID"
  value       = module.firewall_lab.firewall_id
}

output "firewall_lab_firewall_status" {
  description = "Lab firewall status"
  value       = module.firewall_lab.firewall_status
}

output "domain_lab_domain_status" {
  description = "Lab domain status"
  value       = module.domain_lab.domain_status
}

output "tls_nginx_certificate_certificate_pem" {
  description = "Nginx certificate PEM"
  value       = module.tls_nginx.certificate_certificate_pem
}

output "tls_nginx_certificate_issuer_pem" {
  description = "Nginx certificate issuer PEM"
  value       = module.tls_nginx.certificate_issuer_pem
}

output "tls_nginx_certificate_private_key_pem" {
  description = "Nginx certificate private key PEM"
  value       = module.tls_nginx.certificate_private_key_pem
  sensitive   = true
}
