terraform {
  required_version = "1.8.2"

  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.27.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
}
