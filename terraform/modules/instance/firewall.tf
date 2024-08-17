resource "linode_firewall" "firewall" {
  label           = "${var.instance_label}-fw"
  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"
  linodes         = [linode_instance.instance.id]

  dynamic "inbound" {
    for_each = var.firewall_inbound
    content {
      label    = inbound.value["name"]
      action   = "ACCEPT"
      protocol = "TCP"
      ports    = inbound.value["external_port"]
      ipv4     = inbound.value["sources"]
    }
  }
}
