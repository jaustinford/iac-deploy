data "linode_instances" "instances" {
  filter {
    name   = "label"
    values = var.domain_labels
  }
}
