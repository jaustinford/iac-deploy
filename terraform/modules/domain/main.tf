resource "linode_domain" "domain" {
  type      = "master"
  ttl_sec   = var.domain_ttl_sec
  domain    = var.domain_domain
  soa_email = var.domain_soa_email
}

resource "linode_domain_record" "instances" {
  domain_id = linode_domain.domain.id

  for_each = {
    for instance in data.linode_instances.instances.instances: instance.label => {
      label      = instance.label
      ip_address = instance.ip_address
    }
  }

  record_type = "A"
  name        = each.value.label
  target      = each.value.ip_address
}

resource "linode_domain_record" "custom_records" {
  domain_id = linode_domain.domain.id

  for_each = {
    for domain_record in var.domain_records: domain_record.name => {
      name        = domain_record.name
      record_type = domain_record.record_type
      target      = domain_record.target
    }
  }

  name        = each.value.name
  record_type = each.value.record_type
  target      = each.value.target
}
