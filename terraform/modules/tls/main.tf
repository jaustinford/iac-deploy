resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = var.private_key_rsa_bits
}

resource "acme_registration" "registration" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.registration_email_address
}

resource "acme_certificate" "certificate" {
  account_key_pem           = acme_registration.registration.account_key_pem
  common_name               = var.certificate_common_name
  subject_alternative_names = var.certificate_subject_alternative_names
  min_days_remaining        = var.certificate_min_days_remaining

  dns_challenge {
    provider = "linode"

    config = {
      LINODE_TOKEN_FILE = "/root/linode_token"
    }
  }

  depends_on = [acme_registration.registration]
}

resource "vault_generic_secret" "generic_secret" {
  count = var.vault_token ? 1 : 0

  path = "lab/kv/certificates/nginx"

  data_json = jsonencode(
    {
      CERT_PEM_B64 = base64encode(acme_certificate.certificate.certificate_pem),
      CA_PEM_B64   = base64encode(acme_certificate.certificate.issuer_pem),
      KEY_PEM_B64  = base64encode(acme_certificate.certificate.private_key_pem)
    }
  )
}
