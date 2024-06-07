output "tls_certificate_pem" {
  value     = acme_certificate.tls.certificate_pem
  sensitive = true
}

output "tls_issuer_pem" {
  value     = acme_certificate.tls.issuer_pem
  sensitive = true
}

output "tls_private_key_pem" {
  value     = acme_certificate.tls.private_key_pem
  sensitive = true
}
