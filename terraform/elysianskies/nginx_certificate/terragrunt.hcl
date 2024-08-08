terraform {
  source = "../../modules//tls"
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_version = "1.9.3"

  backend "local" {
    path = "/tfstate/nginx_certificate.json"
  }

  required_providers {
    acme = {
      source  = "vancluever/acme"
      version = "~> 2.5.3"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}
EOF
}

inputs = {
  registration_email_address = "j.austin.ford@gmail.com"
  certificate_common_name    = "home.elysianskies.com"

  certificate_subject_alternative_names = [
    "*.home.elysianskies.com",
    "*.docker01-teine.home.elysianskies.com",
    "*.docker02-teine.home.elysianskies.com"
  ]
}
