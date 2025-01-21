module "vpc_elysianskies" {
  source = "../modules/vpc"

  vpc_label       = "elysianskies"
  vpc_subnet_ipv4 = "192.168.0.0/29"
}

module "instance_portal" {
  source = "../modules/instance"

  instance_label = "portal"

  instance_config_private_interfaces = [
    {
      purpose   = "vpc"
      subnet_id = module.vpc_elysianskies.vpc_subnet_id
      primary   = true
      vpc_ipv4  = "dhcp"
    }
  ]

  instance_disk_authorized_keys = split(
    "\n",
    templatefile(
      "${path.module}/templates/authorized_keys",
      {
        domain_name = local.domain_name
      }
    )
  )

  tag_ci_pipeline_id = var.tag_ci_pipeline_id

  depends_on = [module.vpc_elysianskies]
}

module "firewall_elysianskies" {
  source = "../modules/firewall"

  firewall_label   = "elysianskies"
  firewall_linodes = module.instance_portal.instance_id

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

  tag_ci_pipeline_id = var.tag_ci_pipeline_id

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
      target      = module.instance_portal.instance_ip_address[0]
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

  tag_ci_pipeline_id = var.tag_ci_pipeline_id

  depends_on = [module.instance_portal]
}

module "tls_nginx" {
  source = "../modules/tls"

  registration_email_address = local.user_email
  certificate_common_name    = "home.${local.domain_name}"

  certificate_subject_alternative_names = [
    "*.home.${local.domain_name}",
    "*.docker01-teine.home.${local.domain_name}",
    "*.docker02-teine.home.${local.domain_name}"
  ]

  depends_on = [module.domain_elysianskies]

  lifecycle {
    prevent_destroy = true
  }
}
