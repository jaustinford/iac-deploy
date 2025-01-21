resource "linode_domain" "domain" {
  type      = "master"
  ttl_sec   = var.domain_ttl_sec
  domain    = var.domain_domain
  soa_email = var.domain_soa_email

  tags = [
    "Pipeline ID : ${var.tag_ci_pipeline_id}"
  ]

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "linode_domain_record" "domain_records" {
  for_each = {
    for domain_record in var.domain_records : domain_record.name => {
      record_type = domain_record.record_type
      name        = domain_record.name
      target      = domain_record.target
    }
  }

  domain_id   = linode_domain.domain.id
  record_type = each.value.record_type
  name        = each.value.name
  target      = each.value.target
}
