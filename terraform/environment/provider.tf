terraform {
  required_version = "1.10.4"

  required_providers {
    acme = {
      source  = "vancluever/acme"
      version = "2.29.0"
    }
  }
}

provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}
