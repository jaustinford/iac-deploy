resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = var.private_key_rsa_bits

  lifecycle {
    prevent_destroy = true
  }
}

resource "acme_registration" "registration" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.registration_email_address

  lifecycle {
    prevent_destroy = true
  }
}

resource "acme_certificate" "certificate" {
  account_key_pem           = acme_registration.registration.account_key_pem
  common_name               = var.certificate_common_name
  subject_alternative_names = var.certificate_subject_alternative_names
  min_days_remaining        = var.certificate_min_days_remaining

  dns_challenge {
    provider = "linode"
  }

  depends_on = [acme_registration.registration]

  lifecycle {
    prevent_destroy = true
  }
}
