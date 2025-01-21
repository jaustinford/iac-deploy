###########################################################
# module - root_password
###########################################################

variable "root_password_length" {
  type        = number
  description = "Character length of root password"
  default     = 24
}

variable "root_password_special" {
  type        = bool
  description = "Should the root password have special characters"
  default     = true
}

###########################################################
# module - instance - settings
###########################################################

variable "instance_count" {
  type        = number
  description = "Number of instances to deploy"
  default     = 1
}

variable "instance_region" {
  type        = string
  description = "Region to deploy instance"
  default     = "us-ord"

  validation {
    condition = contains(
      concat(
        local.instance_regions.north_america,
        local.instance_regions.asia,
        local.instance_regions.europe,
        local.instance_regions.oceania,
        local.instance_regions.south_america
      ),
      var.instance_region
    )

    error_message = "Incorrect value for region"
  }
}

variable "instance_type" {
  type        = string
  description = "Compute type for instance"
  default     = "g6-nanode-1"

  validation {
    condition = contains(
      local.instance_types,
      var.instance_type
    )

    error_message = "Incorrect value for instance type"
  }
}

variable "instance_label" {
  type        = string
  description = "Attach labels to Linode resource"
}

variable "instance_migration_type" {
  type        = string
  description = "Migration type when updating type or region"
  default     = "cold"

  validation {
    condition = contains(
      [
        "cold",
        "warm"
      ],
      var.instance_migration_type
    )

    error_message = "Incorrect value for instance migration type"
  }
}

variable "instance_disk_encrypted" {
  type        = string
  description = "Enable or disable disk encryption"
  default     = "enabled"

  validation {
    condition = contains(
      [
        "enabled",
        "disabled"
      ],
      var.instance_disk_encrypted
    )

    error_message = "Incorrect value for disk encryption"
  }
}

###########################################################
# module - instance - alerting
###########################################################

variable "instance_alerts_cpu" {
  type        = number
  description = "Average CPU usage over 2 hours exceeding this value triggers this alert - percentage"
  default     = 90
}

variable "instance_alerts_network_in" {
  type        = number
  description = "Average incoming traffic over a 2 hour period exceeding this value triggers this alert - Mb/s"
  default     = 10
}

variable "instance_alerts_network_out" {
  type        = number
  description = "Average outbound traffic over a 2 hour period exceeding this value triggers this alert - Mb/s"
  default     = 10
}

variable "instance_alerts_transfer_quota" {
  type        = number
  description = "Percentage of network transfer quota used being greater than this value will trigger this alert - percentage"
  default     = 80
}

variable "instance_alerts_io" {
  type        = number
  description = "Average Disk I/O ops/sec over 2 hours exceeding this value triggers this alert - iops"
  default     = 10000
}

###########################################################
# module - instance - booleans
###########################################################

variable "instance_private_ip" {
  type        = bool
  description = "Should instance be on Linode's shared 192.168.128.0/17 network"
  default     = false
}

variable "instance_resize_disk" {
  type        = bool
  description = "Should the instance have a dynamically managed hard disk"
  default     = false
}

variable "instance_backups_enabled" {
  type        = bool
  description = "Should the instance be backed up"
  default     = false
}

variable "instance_watchdog_enabled" {
  type        = bool
  description = "Should the instance be power managed through Lassie"
  default     = true
}

variable "instance_placement_group_externally_managed" {
  type        = bool
  description = "Should the instance be controlled by a placement group"
  default     = false
}

###########################################################
# module - instance_disk
###########################################################

variable "instance_disk_boot_size" {
  type        = number
  description = "Size in GB for boot disk"
  default     = 10
}

variable "instance_disk_swap_size" {
  type        = number
  description = "Size in MB for swap disk"
  default     = 512
}

variable "instance_disk_boot_filesystem" {
  type        = string
  description = "Type of filesystem for boot disk"
  default     = "ext4"

  validation {
    condition = contains(
      [
        "raw",
        "swap",
        "ext3",
        "ext4",
        "initrd"
      ],
      var.instance_disk_boot_filesystem
    )

    error_message = "Incorrect value for instance disk filesystem"
  }
}

variable "instance_disk_image" {
  type        = string
  description = "Image to run on instance"
  default     = "linode/ubuntu22.04"

  validation {
    condition = contains(
      local.instance_disk_images,
      var.instance_disk_image
    )

    error_message = "Incorrect value for instance image"
  }
}

variable "instance_disk_authorized_keys" {
  type        = list(string)
  description = "SSH keys to install into instance"
}

###########################################################
# module - instance_config
###########################################################

variable "instance_config_booted" {
  type        = bool
  description = "Should the instance be running"
  default     = true
}

variable "instance_config_interfaces" {
  type = list(
    object(
      {
        purpose   = string
        subnet_id = number
        vpc_ipv4  = string
      }
    )
  )

  description = "Define a list of interfaces"

  default = [
    {
      purpose   = "public"
      subnet_id = 0
      vpc_ipv4  = ""
    }
  ]
}

###########################################################
# module - placement_group
###########################################################

variable "instance_placement_group_type" {
  type        = string
  description = "Assign affinity rules"
  default     = "anti_affinity:local"
}

variable "instance_placement_group_policy" {
  type        = string
  description = "Assign affinity policy"
  default     = "strict"
}

###########################################################
# tags
###########################################################

variable "tag_ci_pipeline_id" {
  type        = string
  description = "Tag for CI_PIPELINE_ID"
}
