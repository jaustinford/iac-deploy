data "linode_instances" "instance" {
  filter {
    name   = "label"
    values = var.instance_labels
  }
}
