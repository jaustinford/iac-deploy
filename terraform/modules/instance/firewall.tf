resource "linode_firewall" "firewall" {
  label           = "${var.instance_label}-fw"
  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"
  linodes         = [linode_instance.instance.id]

  inbound {
    action   = "ACCEPT"
    protocol = "TCP"
    label    = "ssh"
    ports    = "22"
    ipv4     = ["${data.http.wan_ip.response_body}/32"]
  }

  dynamic "inbound" {
    for_each = var.firewall_inbound

    content {
      action   = "ACCEPT"
      protocol = inbound.value.protocol
      label    = inbound.value.label
      ports    = inbound.value.ports
      ipv4     = inbound.value.ipv4
    }
  }
}
