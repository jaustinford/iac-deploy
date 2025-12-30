terraform {
  required_version = "1.10.4"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.0.0"
    }

    acme = {
      source  = "vancluever/acme"
      version = "2.29.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "4.0.6"
    }
  }
}
