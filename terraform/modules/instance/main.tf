resource "random_password" "root_password" {
  length  = var.root_password_length
  special = var.root_password_special
}

resource "linode_instance" "instance" {

  #########################################
  # settings
  #########################################

  region = var.instance_region
  type   = var.instance_type
  label  = var.instance_label
  image  = var.instance_image

  #########################################
  # alerting
  #########################################

  alerts {
    cpu            = var.instance_alerts_cpu
    network_in     = var.instance_alerts_network_in
    network_out    = var.instance_alerts_network_out
    transfer_quota = var.instance_alerts_transfer_quota
    io             = var.instance_alerts_io
  }

  #########################################
  # booleans
  #########################################

  private_ip       = var.instance_private_ip
  resize_disk      = var.instance_resize_disk
  backups_enabled  = var.instance_backups_enabled
  watchdog_enabled = var.instance_watchdog_enabled
  booted           = var.instance_booted

  #########################################
  # user authentication
  #########################################

  authorized_keys = var.instance_authorized_keys
  root_pass       = random_password.root_password.result
}
