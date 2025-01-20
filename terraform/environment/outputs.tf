output "vpc_elysianskies_vpc_id" {
  description = "ElysianSkies VPC ID"
  value       = module.vpc_elysianskies.vpc_id 
}

output "vpc_elysianskies_vpc_subnet_id" {
  description = "ElysianSkies VPC subnet ID"
  value       = module.vpc_elysianskies.vpc_subnet_id 
}

output "instance_portal_instance_id" {
  description = "Portal instance ID"
  value       = module.instance_portal.instance_id
}

output "instance_portal_ip_address" {
  description = "Portal instance IP address"
  value       = module.instance_portal.instance_ip_address
}

output "firewall_elysianskies_firewall_id" {
  description = "ElysianSkies firewall ID"
  value       = module.firewall_elysianskies.firewall_id
}

output "firewall_elysianskies_firewall_status" {
  description = "ElysianSkies firewall status"
  value       = module.firewall_elysianskies.firewall_status
}

output "domain_elysianskies_domain_status" {
  description = "ElysianSkies domain status"
  value       = module.domain_elysianskies.domain_status
}

output "tls_nginx_certificate_certificate_pem" {
  description = "Nginx certificate PEM"
  value       = module.tls_nginx.certificate_certificate_pem 
}
