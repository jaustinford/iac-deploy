terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.32.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}
