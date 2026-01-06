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
  # instance - settings
  ###########################################################

  region          = var.instance_region
  type            = var.instance_type
  label           = "${var.instance_label}-${random_string.name_uuid[count.index].result}"
  migration_type  = var.instance_migration_type
  disk_encryption = var.instance_disk_encryption

  ###########################################################
  # instance - alerting
  ###########################################################

  alerts {
    cpu            = var.instance_alerts_cpu
    network_in     = var.instance_alerts_network_in
    network_out    = var.instance_alerts_network_out
    transfer_quota = var.instance_alerts_transfer_quota
    io             = var.instance_alerts_io
  }

  ###########################################################
  # instance - booleans
  ###########################################################

  private_ip       = var.instance_private_ip
  backups_enabled  = var.instance_backups_enabled
  watchdog_enabled = var.instance_watchdog_enabled

  placement_group_externally_managed = var.instance_placement_group_externally_managed

  ###########################################################
  # instance - tags
  ###########################################################

  tags = [
    "Pipeline ID : ${var.tag_ci_pipeline_id}"
  ]

  lifecycle {
    ignore_changes = [tags]
  }
}

###########################################################
# instance_disk
###########################################################

resource "linode_instance_disk" "boot_disk" {
  count = var.instance_count

  label      = "${var.instance_label}-${random_string.name_uuid[count.index].result}-boot-disk"
  linode_id  = linode_instance.instance[count.index].id
  size       = var.instance_disk_boot_size * 1024
  filesystem = var.instance_disk_boot_filesystem
  image      = var.instance_disk_boot_image

  authorized_keys = var.instance_disk_authorized_keys
  root_pass       = random_password.root_password[count.index].result
}

resource "linode_instance_disk" "swap_disk" {
  count = var.instance_count

  label      = "${var.instance_label}-${random_string.name_uuid[count.index].result}-swap-disk"
  linode_id  = linode_instance.instance[count.index].id
  size       = var.instance_disk_swap_size
  filesystem = "swap"
}

###########################################################
# instance_config
###########################################################

resource "linode_instance_config" "instance_config" {
  count = var.instance_count

  label       = "${var.instance_label}-${random_string.name_uuid[count.index].result}-instance-config"
  linode_id   = linode_instance.instance[count.index].id
  booted      = var.instance_config_booted
  root_device = "/dev/sda"

  device {
    device_name = "sda"
    disk_id     = linode_instance_disk.boot_disk[count.index].id
  }

  device {
    device_name = "sdb"
    disk_id     = linode_instance_disk.swap_disk[count.index].id
  }

  dynamic "interface" {
    for_each = (var.instance_config_public_interface ? [0] : [])

    content {
      purpose = "public"
    }
  }

  dynamic "interface" {
    for_each = var.instance_config_private_interfaces

    content {
      purpose   = interface.value.purpose
      subnet_id = interface.value.subnet_id
      primary   = interface.value.primary

      dynamic "ipv4" {
        for_each = ((interface.value.vpc_ipv4 != "dhcp" && var.instance_config_public_interface == false) ? [0] : [])

        content {
          vpc = interface.value.vpc_ipv4
        }
      }

      dynamic "ipv4" {
        for_each = ((interface.value.vpc_ipv4 != "dhcp" && var.instance_config_public_interface) ? [0] : [])

        content {
          vpc     = interface.value.vpc_ipv4
          nat_1_1 = "any"
        }
      }

      dynamic "ipv4" {
        for_each = ((interface.value.vpc_ipv4 == "dhcp" && var.instance_config_public_interface) ? [0] : [])

        content {
          nat_1_1 = "any"
        }
      }
    }
  }
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

###########################################################
# ssh_copy
###########################################################

resource "local_file" "instance_data_file" {
  count = var.instance_count

  content = jsonencode(
    {
      id         = linode_instance.instance[count.index].id
      ip_address = linode_instance.instance[count.index].ip_address
    }
  )

  filename = "/tmp/${linode_instance.instance[count.index].label}.json"
}

resource "null_resource" "persisted_metadata" {
  count = var.instance_count

  connection {
    type = "ssh"
    host = "192.168.40.4"
    user = "queen"
    
    private_key = chomp(file("/automation/iac-deploy.key"))
  }

  provisioner "file" {
    source      = "/tmp/${linode_instance.instance[count.index].label}.json"
    destination = "/home/queen/${linode_instance.instance[count.index].label}.json"
  }

  provisioner "remote-exec" {
    when = destroy

    inline = ["rm -f /home/queen/pendragonlab*.json"]
  }
}
