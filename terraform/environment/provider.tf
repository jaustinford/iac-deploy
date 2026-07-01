terraform {
  required_version = "1.10.4"

  required_providers {
    linode = {
      source  = "linode/linode"
      version = ">= 2.0.0"
    }

    acme = {
      source  = "vancluever/acme"
      version = "2.29.0"
    }

    http = {
      source  = "hashicorp/http"
      version = "3.4.5"
    }
  }
}

provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

provider "linode" {
  token = chomp(file("/automation/linode-token"))
}
