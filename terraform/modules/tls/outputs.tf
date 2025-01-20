output "certificate_certificate_pem" {
  description = "Certificate PEM"
  value       = acme_certificate.certificate.certificate_pem
}

output "certificate_issuer_pem" {
  description = "Certificate issuer PEM"
  value       = acme_certificate.certificate.issuer_pem
}

output "certificate_private_key_pem" {
  description = "Certificate private key PEM"
  value       = acme_certificate.certificate.private_key_pem
  sensitive   = true
}
