##################################################
# data sources
##################################################

data "http" "wan_ip" {  
  url = "http://ifconfig.me/ip"
}

##################################################
# module
##################################################

resource "linode_firewall" "firewall" {
  label           = "${var.firewall_label}-fw"
  inbound_policy  = var.firewall_inbound_policy
  outbound_policy = var.firewall_outbound_policy
  linodes         = toset(var.firewall_linodes)
  disabled        = var.firewall_disabled

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
      action   = inbound.value.action
      protocol = inbound.value.protocol
      label    = inbound.value.label
      ports    = inbound.value.ports
      ipv4     = inbound.value.ipv4
    }
  }

  tags = [
    "Pipeline ID : ${var.tag_ci_pipeline_id}"
  ]

  lifecycle {
    ignore_changes = [tags]
  }
}
