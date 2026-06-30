terraform {
  required_version = "1.10.4"

  required_providers {
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
