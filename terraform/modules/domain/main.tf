resource "linode_domain" "domain" {
  type      = "master"
  ttl_sec   = var.domain_ttl_sec
  domain    = var.domain_domain
  soa_email = var.domain_soa_email
}

resource "linode_domain_record" "a_records" {
  for_each = {
    for linode_instance in data.linode_instances.instances.instances : linode_instance.label => {
      label      = linode_instance.label
      ip_address = linode_instance.ip_address
    }
  }

  domain_id   = linode_domain.domain.id
  record_type = "A"
  name        = each.value.label
  target      = each.value.ip_address
}

resource "linode_domain_record" "alias_records" {
  for_each = {
    for domain_alias_record in var.domain_alias_records : domain_alias_record.name => {
      name   = domain_alias_record.name
      target = domain_alias_record.target
    }
  }

  domain_id   = linode_domain.domain.id
  record_type = "CNAME"
  name        = each.value.name
  target      = each.value.target
}
