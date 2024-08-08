generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_version = "1.9.3"

  backend "local" {
    path = "/tfstate/${path_relative_from_include()}.json"
  }

  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.27.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.1"
    }

    acme = {
      source  = "vancluever/acme"
      version = "~> 2.5.3"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}
EOF
}
