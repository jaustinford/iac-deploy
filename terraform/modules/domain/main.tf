resource "linode_domain" "domain" {
  type      = "master"
  ttl_sec   = var.domain_dns_ttl
  domain    = var.domain_name
  soa_email = var.domain_soa_email
}

resource "linode_domain_record" "linode_domain_record_instances" {
  for_each    = {for instance in data.linode_instances.instance.instances: instance.label => instance}
  domain_id   = linode_domain.domain.id
  name        = each.value["label"]
  record_type = "A"
  target      = each.value["ip_address"]
}

resource "linode_domain_record" "linode_domain_record_extra" {
  for_each    = {for domain_record in var.domain_records: domain_record.name => domain_record}
  domain_id   = linode_domain.domain.id
  name        = each.key
  record_type = each.value["record_type"]
  target      = each.value["target"]
}
