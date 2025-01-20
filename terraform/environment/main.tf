module "vpc_elysianskies" {
  source = "../modules/vpc"

  vpc_label       = "elysianskies"
  vpc_subnet_ipv4 = "192.168.600.0/29"
}

module "instance_portal" {
  source = "../modules/instance"

  instance_label = "portal"

  instance_interfaces = [
    {
      purpose   = "public"
      subnet_id = 0
      vpc_ipv4  = ""
    },
    {
      purpose   = "vpc"
      subnet_id = module.vpc_elysianskies.vpc_subnet_id
      vpc_ipv4  = "dhcp"
    }
  ]

  instance_authorized_keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCw5PQecme+/WsJYSh0bjEiawrsnIwvxZe7QWuCMdDUJgYNwz0yR3IdVlPBd1gf+PCD3qz9SkwTpGsoyYHptjjUw/TYRvEEQaC2x5OwZIuprcTFYztGvDDmEX5giZdNy6Aq9uGrtnzQZRd2T8JSLi/5jLJ7HWz/b1IO2puj4g/E++njPeP4Hh0FI5SPgUzdLP0GHPCAXvZXz3O9QS9kbZ28ICZ4OVjTy2WBaHsfz5XLZ4mdjZIJKp1j2zyPe3WGUhYKOpoA1clk6T7ZPGZDwRUAZDHB4A8HZHepmAwVsHATad/Jq4PfBHzsB4DhNrp7vez5C/51WI+jJJBvkQqALxgti6D12770WCHKfxD5kFR4xzSZoXEt6RZ2oz+7wb+F5HXGGDsufP7rCDsAHU3ciu8riV5J8dRY/PwQEUO5YMwxQAEIStrThDJxh3TIU2dou9u3yKdsWA8ZWULe7uJj5uR0x2SLNX1H7jnZJwBeasPFSfaGPifkJNkAzuFLKsY9shMSLmLaLfgQ4vZtFyboAVvVZfMw1I5wKGhBCT5PJJ4VwuO1YX8gz7GWwc+FD/omwX6uH3LMMaCb9RKMcETXw1aB1CXEA1t3qSkIQ/G7jSdDKlPZiIvPJOGeFRZTwepvtdoBYL2kmx/UcS3BFZxXkdKN8C+p9/vg+sX9A+WE1BaBTw== austin@${local.domain_name}"]

  depends_on = [module.vpc_elysianskies]
}

module "firewall_elysianskies" {
  source = "../modules/firewall"

  firewall_label   = "elysianskies"
  firewall_linodes = [module.instance_portal.instance_id]

  firewall_inbound = [
    {
      protocol = "TCP"
      label    = "openvpnas"
      ports    = "1194"
      ipv4     = ["0.0.0.0/0"]
    },
    {
      protocol = "TCP"
      label    = "web"
      ports    = "443"
      ipv4     = ["0.0.0.0/0"]
    }
  ]

  depends_on = [module.instance_portal]
}

module "domain_elysianskies" {
  source = "../modules/domain"

  domain_soa_email = local.user_email
  domain_domain    = local.domain_name

  domain_records = [
    {
      record_type = "A"
      name        = "portal"
      target      = module.instance_portal.instance_ip_address
    },
    {
      record_type = "CNAME"
      name        = "home"
      target      = "portal.${local.domain_name}"
    },
    {
      record_type = "CNAME"
      name        = "*.home"
      target      = "home.${local.domain_name}"
    }
  ]

  depends_on = [module.instance_portal]
}

module "tls_nginx" {
  source = "../modules/tls"

  registration_email_address = local.user_email
  certificate_common_name    = "home.${local.domain_name}"

  certificate_subject_alternative_names = [
    "*.${local.domain_name}",
    "*.docker01-teine.home.${local.domain_name}",
    "*.docker02-teine.home.${local.domain_name}"
  ]

  depends_on = [module.domain_elysianskies]
}
