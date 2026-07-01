module "domain_lab" {
  source = "../modules/linode.domain"

  domain_soa_email = local.svc_email
  domain_domain    = local.domain_name

  tag_ci_pipeline_id = var.tag_ci_pipeline_id
}

module "tls_nginx" {
  source = "../modules/acme.tls"

  registration_email_address = local.svc_email
  certificate_common_name    = local.domain_name

  certificate_subject_alternative_names = [
    "*.${local.domain_name}",
    "*.proxy-ext.${local.domain_name}",
    "*.proxy-int.${local.domain_name}"
  ]

  depends_on = [module.domain_lab]
}

module "instance_portal" {
  source = "../modules/linode.instance"

  instance_label = "${local.domain_root}-portal"

  stackscript_iac_user_name           = base64decode(local.iac_user.name)
  stackscript_iac_user_id             = local.iac_user.id
  stackscript_iac_user_authorized_key = local.iac_user.authorized_key

  tag_ci_pipeline_id = var.tag_ci_pipeline_id
}

module "firewall_portal" {
  source = "../modules/linode.firewall"

  firewall_label   = local.domain_root
  firewall_linodes = module.instance_portal.instance_id

  firewall_inbound = [
    {
      action   = "DROP"
      protocol = "TCP"
      label    = "vpn-drop"
      ports    = "1194"
      ipv4     = local.drop_cidrs
    },
    {
      action   = "ACCEPT"
      protocol = "TCP"
      label    = "vpn-accept"
      ports    = "1194"
      ipv4     = ["0.0.0.0/0"]
    },
    {
      action   = "DROP"
      protocol = "TCP"
      label    = "web-drop"
      ports    = "443"
      ipv4     = local.drop_cidrs
    },
    {
      action   = "ACCEPT"
      protocol = "TCP"
      label    = "web-accept"
      ports    = "443"
      ipv4     = ["0.0.0.0/0"]
    },
    {
      action   = "DROP"
      protocol = "TCP"
      label    = "gitlab-drop"
      ports    = "32515"
      ipv4     = local.drop_cidrs
    },
    {
      action   = "ACCEPT"
      protocol = "TCP"
      label    = "gitlab-accept"
      ports    = "32515"
      ipv4     = ["0.0.0.0/0"]
    }
  ]

  tag_ci_pipeline_id = var.tag_ci_pipeline_id

  depends_on = [module.instance_portal]
}

module "record_portal" {
  source = "../modules/linode.record"

  records_domain_id = module.domain_lab.domain_id

  domain_records = [
    {
      record_type = "CNAME"
      name        = "*"
      target      = "proxy-ext.${local.domain_name}"
    },
    {
      record_type = "CNAME"
      name        = "*.proxy-ext"
      target      = "proxy-ext.${local.domain_name}"
    },
    {
      record_type = "CNAME"
      name        = "proxy-ext"
      target      = "portal.${local.domain_name}"
    },
    {
      record_type = "A"
      name        = "portal"
      target      = module.instance_portal.instance_ip_address[0]
    },
    {
      record_type = "A"
      name        = ""
      target      = module.instance_portal.instance_ip_address[0]
    }
  ]

  depends_on = [
    module.domain_lab,
    module.instance_portal
  ]
}
