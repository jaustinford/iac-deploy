##################################################
# module - instance
##################################################

resource "linode_instance" "instance" {
  count = var.instance_count

  # settings

  region          = var.instance_region
  type            = var.instance_type
  label           = "${var.instance_label}-${module.string_uuid[count.index].string_result}"
  migration_type  = var.instance_migration_type
  disk_encryption = var.instance_disk_encryption

  # alerting

  alerts {
    cpu            = var.instance_alerts_cpu
    network_in     = var.instance_alerts_network_in
    network_out    = var.instance_alerts_network_out
    transfer_quota = var.instance_alerts_transfer_quota
    io             = var.instance_alerts_io
  }

  # booleans

  private_ip       = var.instance_private_ip
  backups_enabled  = var.instance_backups_enabled
  watchdog_enabled = var.instance_watchdog_enabled

  # tags

  tags = [
    "Pipeline ID : ${var.tag_ci_pipeline_id}"
  ]

  lifecycle {
    ignore_changes = [tags]
  }
}

##################################################
# module - disks
##################################################

resource "linode_instance_disk" "boot_disk" {
  count = var.instance_count

  label      = "${var.instance_label}-${module.string_uuid[count.index].string_result}-boot-disk"
  linode_id  = linode_instance.instance[count.index].id
  size       = var.instance_disk_boot_size * 1024
  filesystem = var.instance_disk_boot_filesystem
  image      = var.instance_disk_boot_image
  root_pass  = module.password_root[count.index].password_result

  # stackscript

  stackscript_id = module.stackscript_instance.stackscript_id

  stackscript_data = {
    iac_user_name           = var.stackscript_iac_user_name
    iac_user_id             = var.stackscript_iac_user_id
    iac_user_authorized_key = var.stackscript_iac_user_authorized_key
  }
}

resource "linode_instance_disk" "swap_disk" {
  count = var.instance_count

  label      = "${var.instance_label}-${module.string_uuid[count.index].string_result}-swap-disk"
  linode_id  = linode_instance.instance[count.index].id
  size       = var.instance_disk_swap_size
  filesystem = "swap"
}

##################################################
# module - instance_config
##################################################

resource "linode_instance_config" "instance_config" {
  count = var.instance_count

  label       = "${var.instance_label}-${module.string_uuid[count.index].string_result}-instance-config"
  linode_id   = linode_instance.instance[count.index].id
  booted      = var.instance_config_booted
  root_device = "/dev/sda"

  # storage

  device {
    device_name = "sda"
    disk_id     = linode_instance_disk.boot_disk[count.index].id
  }

  device {
    device_name = "sdb"
    disk_id     = linode_instance_disk.swap_disk[count.index].id
  }

  # networking

  interface {
    purpose = "public"
    primary = true
  }
}

##################################################
# submodules
##################################################

module "string_uuid" {
  source = "../random.string"

  count = var.instance_count
}

module "password_root" {
  source = "../random.password"

  count = var.instance_count
}

module "stackscript_instance" {
  source = "../linode.stackscript"

  stackscript_label       = "init-iac-user"
  stackscript_description = "Initialize the IAC User"
  stackscript_images      = [var.instance_disk_boot_image]
}
