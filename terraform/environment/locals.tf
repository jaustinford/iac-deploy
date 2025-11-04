locals {
  domain_name = "pendragonlab.com"
  domain_root = trimsuffix(local.domain_name, ".com")
  user_email  = "j.austin.ford@gmail.com"
}
