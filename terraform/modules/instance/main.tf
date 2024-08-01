resource "random_password" "root_password" {
  length  = var.root_password_length
  special = var.root_password_special
}

resource "linode_instance" "instance" {
  label           = var.instance_label
  image           = var.instance_image
  region          = var.instance_region
  type            = var.instance_type
  authorized_keys = var.instance_authorized_keys
  root_pass       = random_password.root_password.id
  private_ip      = var.instance_private_ip
  booted          = var.instance_booted
  firewall_id     = linode_firewall.firewall.id

  depends_on = [linode_firewall.firewall]
}
