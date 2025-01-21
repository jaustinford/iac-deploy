resource "random_password" "root_password" {
  count = var.instance_count

  length  = var.root_password_length
  special = var.root_password_special
}

resource "random_string" "name_uuid" {
  count = var.instance_count

  length  = 10
  special = false
  upper   = false
}

resource "linode_instance" "instance" {
  count = var.instance_count

  ###########################################################
  # settings
  ###########################################################

  region          = var.instance_region
  type            = var.instance_type
  label           = "${var.instance_label}-${random_string.name_uuid[count.index].result}"
  image           = var.instance_image
  disk_encryption = var.instance_disk_encrypted
  migration_type  = var.instance_migration_type

  ###########################################################
  # alerting
  ###########################################################

  alerts {
    cpu            = var.instance_alerts_cpu
    network_in     = var.instance_alerts_network_in
    network_out    = var.instance_alerts_network_out
    transfer_quota = var.instance_alerts_transfer_quota
    io             = var.instance_alerts_io
  }

  ###########################################################
  # booleans
  ###########################################################

  private_ip       = var.instance_private_ip
  resize_disk      = var.instance_resize_disk
  backups_enabled  = var.instance_backups_enabled
  watchdog_enabled = var.instance_watchdog_enabled
  booted           = var.instance_booted

  placement_group_externally_managed = var.instance_placement_group_externally_managed

  ###########################################################
  # user authentication
  ###########################################################

  authorized_keys = var.instance_authorized_keys
  root_pass       = random_password.root_password[count.index].result

  ###########################################################
  # interface
  ###########################################################

  dynamic "interface" {
    for_each = var.instance_interfaces

    content {
      purpose   = interface.value.purpose
      subnet_id = interface.value.subnet_id

      dynamic "ipv4" {
        for_each = ((interface.value.vpc_ipv4 != "dhcp" && interface.value.purpose != "public") ? [0] : [])

        content {
          vpc = interface.value.vpc_ipv4
        }
      }
    }
  }

  ###########################################################
  # tags
  ###########################################################

  tags = [
    "Pipeline URL : ${var.tag_ci_pipeline_url}"
  ]

  lifecycle {
    ignore_changes = [tags]
  }
}

###########################################################
# instance_disk
###########################################################

resource "linode_instance_disk" "instance_disk" {
  count = var.instance_count

  label      = "${var.instance_label}-${random_string.name_uuid[count.index].result}-boot-disk"
  linode_id  = linode_instance.instance[count.index].id
  size       = var.instance_disk_size * 1024
  filesystem = var.instance_disk_filesystem
}

###########################################################
# placement_group
###########################################################

resource "linode_placement_group" "placement_group" {
  count = (var.instance_placement_group_externally_managed ? 1 : 0)

  label                  = "${var.instance_label}-pg"
  region                 = var.instance_region
  placement_group_type   = var.instance_placement_group_type
  placement_group_policy = var.instance_placement_group_policy
}

resource "linode_placement_group_assignment" "placement_group_assignment" {
  count = (var.instance_placement_group_externally_managed ? var.instance_count : 0)

  placement_group_id = linode_placement_group.placement_group[0].id
  linode_id          = linode_instance.instance[count.index].id
}
