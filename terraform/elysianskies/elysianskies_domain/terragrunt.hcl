terraform {
  source = "../../modules//domain"
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
