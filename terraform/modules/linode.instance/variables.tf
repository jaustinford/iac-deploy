##################################################
# module - instance
##################################################

variable "instance_count" {
  type        = number
  description = "Number of instances to deploy"
  default     = 1
}

# settings

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

variable "instance_disk_encryption" {
  type        = string
  description = "Should the disk be encrypted"
  default     = "enabled"

  validation {
    condition = contains(
      [
        "enabled",
        "disabled"
      ],
      var.instance_disk_encryption
    )

    error_message = "Incorrect value for instance disk encryption"
  }
}

# alerting

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

# booleans

variable "instance_private_ip" {
  type        = bool
  description = "Should instance be on Linode's shared 192.168.128.0/17 network"
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

# tags

variable "tag_ci_pipeline_id" {
  type        = string
  description = "Tag for CI_PIPELINE_ID"
}

##################################################
# module - disks
##################################################

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
  description = "Filesystem for instance disk boot drive"
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

    error_message = "Incorrect value for instance disk boot filesystem"
  }
}

variable "instance_disk_boot_image" {
  type        = string
  description = "Deploy with instance disk boot image"
  default     = "linode/ubuntu22.04"

  validation {
    condition = contains(
      local.instance_disk_boot_images,
      var.instance_disk_boot_image
    )

    error_message = "Incorrect value for instance disk boot image"
  }
}

# stackscript

variable "stackscript_iac_user_name" {
  type        = string
  description = "Name of IAC User"
}

variable "stackscript_iac_user_id" {
  type        = string
  description = "Id of IAC User"
}

variable "stackscript_iac_user_authorized_key" {
  type        = string
  description = "Authorized key for IAC User"
}

##################################################
# module - instance_config
##################################################

# storage

variable "instance_config_booted" {
  type        = bool
  description = "Should the instance be running"
  default     = true
}
