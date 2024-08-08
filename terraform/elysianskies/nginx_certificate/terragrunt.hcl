terraform {
  source = "../../modules//tls"
}

inputs = {
  registration_email_address = "j.austin.ford@gmail.com"
  certificate_common_name    = "home.elysianskies.com"

  certificate_subject_alternative_names = [
    "*.home.elysianskies.com",
    "*.docker01-teine.home.elysianskies.com",
    "*.docker02-teine.home.elysianskies.com"
  ]
}
