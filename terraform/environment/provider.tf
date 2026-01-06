terraform {
  required_version = "1.10.4"

  required_providers {
    linode = {
      source  = "linode/linode"
      version = ">= 2.0.0"
    }

    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.0.0"
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

data "http" "approle_login" {
  count = var.vault_token ? 1 : 0

  url    = "${var.vault_addr}/v1/auth/approle/login"
  method = "POST"

  request_body = jsonencode(
    {
      role_id   = jsondecode(file("/approle/iac-deploy.json"))["role_id"]
      secret_id = jsondecode(file("/approle/iac-deploy.json"))["secret_id"]
    }
  )
}

provider "vault" {
  token   = var.vault_token ? jsondecode(data.http.approle_login[0].response_body)["auth"]["client_token"] : ""
  address = var.vault_addr
}

ephemeral "vault_kv_secret_v2" "linode_api_token" {
  count = var.vault_token ? 1 : 0

  name  = "external/linode"
  mount = "lab/kv"
}

provider "linode" {
  token = chomp(file("/automation/linode-token"))
}
