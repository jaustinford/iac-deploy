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

    tls = {
      source  = "hashicorp/tls"
      version = "4.0.6"
    }
  }
}

provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

provider "vault" {
  address = "https://access.proxy-int.pendragonlab.com"

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = jsondecode(file("/approle/iac-deploy.json"))["role_id"]
      secret_id = jsondecode(file("/approle/iac-deploy.json"))["secret_id"]
    }
  }
}

ephemeral "vault_kv_secret_v2" "linode_api_token" {
  name  = "external/linode"
  mount = "lab/kv"
}

provider "linode" {
  token  = ephemeral.vault_kv_secret_v2.linode_api_token.data["API_TOKEN"]
}
