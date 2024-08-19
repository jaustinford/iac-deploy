include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules//domain"
}

inputs = {
  domain_domain    = "elysianskies.com"
  domain_soa_email = "j.austin.ford@gmail.com"

  domain_labels = ["portal"]

  domain_alias_records = [
    {
      name   = "home"
      target = "portal.elysianskies.com"
    },
    {
      name   = "*.home"
      target = "home.elysianskies.com"
    }
  ]
}
