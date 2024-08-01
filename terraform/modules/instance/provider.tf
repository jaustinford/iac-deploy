terraform {
  backend "http" {}

  required_version = "1.8.2"

  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.27.0"
    }
  }
}

provider "random" {}

provider "linode" {}
