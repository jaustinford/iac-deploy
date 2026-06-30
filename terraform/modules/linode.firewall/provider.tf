terraform {
  required_version = "1.10.4"

  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.32.0"
    }

    http = {
      source  = "hashicorp/http"
      version = "3.4.5"
    }
  }
}
