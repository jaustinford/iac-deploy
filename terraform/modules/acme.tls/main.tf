##################################################
# module
##################################################

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
  pre_check_delay           = var.certificate_pre_check_delay

  dns_challenge {
    provider = "linode"

    config = {
      LINODE_TOKEN = chomp(file("/automation/linode-token"))
    }
  }

  depends_on = [acme_registration.registration]
}
