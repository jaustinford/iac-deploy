terraform {
  required_version = "1.10.4"

  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.32.0"
    }

    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.0.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.4"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.6.1"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}
