##################################################
# module
##################################################

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
