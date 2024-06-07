resource "linode_firewall" "firewall" {
  label           = "firewall"
  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"
  linodes         = [data.linode_instances.instance.instances[0].id]
  dynamic "inbound" {
    for_each = var.firewall_ingresses
    content {
      label    = inbound.value["name"]
      action   = "ACCEPT"
      protocol = "TCP"
      ports    = inbound.value["external_port"]
      ipv4     = inbound.value["sources"]
    }
  }
}
