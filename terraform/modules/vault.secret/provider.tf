terraform {
  required_version = "1.10.4"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.0.0"
    }
  }
}
