terraform {
  source = "../../modules//domain"
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_version = "1.9.3"

  backend "local" {
    path = "/tfstate/elysianskies_domain.json"
  }

  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.27.0"
    }
  }
}
EOF
}

inputs = {
  domain_domain    = "elysianskies.com"
  domain_soa_email = "j.austin.ford@gmail.com"
  instance_labels  = ["portal"]

  domain_records = [
    {
      name        = "home"
      record_type = "CNAME"
      target      = "portal.elysianskies.com"
    },
    {
      name        = "*.home"
      record_type = "CNAME"
      target      = "home.elysianskies.com"
    }
  ]
}
