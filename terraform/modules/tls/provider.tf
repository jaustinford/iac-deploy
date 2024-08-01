terraform {
  backend "http" {}

  required_version = "1.8.2"

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

provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}
