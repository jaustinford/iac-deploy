resource "linode_domain_record" "domain_records" {
  for_each = {
    for domain_record in var.domain_records : domain_record.name => {
      record_type = domain_record.record_type
      name        = domain_record.name
      target      = domain_record.target
    }
  }

  domain_id   = var.records_domain_id
  record_type = each.value.record_type
  name        = each.value.name
  target      = each.value.target
}
