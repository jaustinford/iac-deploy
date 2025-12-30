data "vault_generic_secret" "generic_secret_ansible" {
  path = "lab/kv/containers/iac_configure/ssh"
}

data "tls_public_key" "public_key" {
  private_key_openssh = base64decode(
    data.vault_generic_secret.generic_secret_ansible.data["KEY_OPENSSH_B64"]
  )
}

module "vpc_lab" {
  source = "../modules/vpc"

  vpc_label       = local.domain_root
  vpc_subnet_ipv4 = "192.168.80.0/29"
}

module "instance_portal" {
  source = "../modules/instance"

  instance_label = "${local.domain_root}-portal"

  instance_config_private_interfaces = [
    {
      purpose   = "vpc"
      subnet_id = module.vpc_lab.vpc_subnet_id
      primary   = true
      vpc_ipv4  = "dhcp"
    }
  ]

  persisted_metadata_host = "192.168.40.4"
  persisted_metadata_user = "merlin"

  instance_disk_authorized_keys = [
    "${chomp(data.tls_public_key.public_key.public_key_openssh)} ansible-ssh@${local.domain_name}"
  ]

  tag_ci_pipeline_id = var.tag_ci_pipeline_id

  depends_on = [module.vpc_lab]
}

module "firewall_lab" {
  source = "../modules/firewall"

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
    }
  ]

  tag_ci_pipeline_id = var.tag_ci_pipeline_id

  depends_on = [module.instance_portal]
}

module "domain_lab" {
  source = "../modules/domain"

  domain_soa_email = local.user_email
  domain_domain    = local.domain_name

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
    },    {
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

  tag_ci_pipeline_id = var.tag_ci_pipeline_id
}

module "tls_nginx" {
  source = "../modules/tls"

  registration_email_address = local.user_email
  certificate_common_name    = local.domain_name

  certificate_subject_alternative_names = [
    "*.${local.domain_name}",
    "*.proxy-ext.${local.domain_name}",
    "*.proxy-int.${local.domain_name}"
  ]

  depends_on = [module.domain_lab]
}
