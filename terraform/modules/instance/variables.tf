############################################################
# module - root_password
############################################################

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

############################################################
# module - instance - settings
############################################################

variable "instance_region" {
  type        = string
  description = "Region to deploy instance"
  default     = "us-central"

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

    error_message = "Region value is incorrect"
  }
}

variable "instance_type" {
  type        = string
  description = "Compute type for instance"
  default     = "g6-nanode-1"
}

variable "instance_label" {
  type        = string
  description = "Attach labels to Linode resource"
}

variable "instance_image" {
  type        = string
  description = "Image to run on instance"
  default     = "linode/ubuntu22.04"
}

variable "instance_placement_group_externally_managed" {
  type        = bool
  description = "Should the instance be controlled by a placement group"
  default     = true
}

############################################################
# module - instance - alerting
############################################################

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

############################################################
# module - instance - booleans
############################################################

variable "instance_private_ip" {
  type        = bool
  description = "Should instance have a private IP address"
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

variable "instance_booted" {
  type        = bool
  description = "Should the instance be running"
  default     = true
}

###############################################################################
# module - instance - user authentication
###############################################################################

variable "instance_authorized_keys" {
  type        = list(string)
  description = "SSH keys to install into instance"
}

###############################################################################
# module - instance - interface
###############################################################################

variable "instance_subnet_id" {
  type        = string
  description = "VPC subnet ID"
}

###############################################################################
# module - placement_group
###############################################################################

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
