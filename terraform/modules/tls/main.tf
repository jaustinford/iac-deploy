resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "registration" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.certificate_email
}

resource "acme_certificate" "tls" {
  account_key_pem           = acme_registration.registration.account_key_pem
  common_name               = var.certificate_cn
  subject_alternative_names = var.certificate_sans

  dns_challenge {
    provider = "linode"
    config   = {
      LINODE_TOKEN = var.linode_token
    }
  }

  depends_on = [
    acme_registration.registration
  ]
}
