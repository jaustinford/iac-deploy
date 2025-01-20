resource "random_password" "root_password" {
  length  = var.root_password_length
  special = var.root_password_special
}

resource "linode_instance" "instance" {

  ###############################################################################
  # settings
  ###############################################################################

  region = var.instance_region
  type   = var.instance_type
  label  = var.instance_label
  image  = var.instance_image

  placement_group_externally_managed = var.instance_placement_group_externally_managed

  ###############################################################################
  # alerting
  ###############################################################################

  alerts {
    cpu            = var.instance_alerts_cpu
    network_in     = var.instance_alerts_network_in
    network_out    = var.instance_alerts_network_out
    transfer_quota = var.instance_alerts_transfer_quota
    io             = var.instance_alerts_io
  }

  ###############################################################################
  # booleans
  ###############################################################################

  private_ip       = var.instance_private_ip
  resize_disk      = var.instance_resize_disk
  backups_enabled  = var.instance_backups_enabled
  watchdog_enabled = var.instance_watchdog_enabled
  booted           = var.instance_booted

  ###############################################################################
  # user authentication
  ###############################################################################

  authorized_keys = var.instance_authorized_keys
  root_pass       = random_password.root_password.result

  ###############################################################################
  # interface
  ###############################################################################

  interface {
    purpose = "public"
  }

  interface {
    purpose   = "vpc"
    subnet_id = var.instance_subnet_id
  }
}

###############################################################################
# placement_group
###############################################################################

resource "linode_placement_group" "placement_group" {
  count = var.instance_placement_group_externally_managed ? 1 : 0

  label                  = "${var.instance_label}-pg"
  region                 = var.instance_region
  placement_group_type   = var.instance_placement_group_type
  placement_group_policy = var.instance_placement_group_policy
}

resource "linode_placement_group_assignment" "placement_group_assignment" {
  count = var.instance_placement_group_externally_managed ? 1 : 0

  placement_group_id = linode_placement_group.placement_group[0].id
  linode_id          = linode_instance.instance.id
}
