data "linode_instances" "instances" {
  filter {
    name   = "label"
    values = var.instance_labels
  }
}
