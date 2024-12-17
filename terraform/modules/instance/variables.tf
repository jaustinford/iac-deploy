#########################################
# root_password
#########################################

variable "root_password_length" {
  description = "Character length of root password"
  type        = number
  default     = 24
}

variable "root_password_special" {
  description = "Should the root password have special characters"
  type        = bool
  default     = true
}

#########################################
# instance - settings
#########################################

variable "instance_region" {
  description = "Region to deploy instance"
  type        = string
  default     = "us-central"
}

variable "instance_type" {
  description = "Compute type for instance"
  type        = string
  default     = "g6-nanode-1"
}

variable "instance_label" {
  description = "Attach labels to Linode resource"
  type        = string
}

variable "instance_image" {
  description = "Image to run on instance"
  type        = string
  default     = "linode/ubuntu22.04"
}

#########################################
# instance - alerting
#########################################

variable "instance_alerts_cpu" {
  description = "Average CPU usage over 2 hours exceeding this value triggers this alert - percentage"
  type        = number
  default     = 90
}

variable "instance_alerts_network_in" {
  description = "Average incoming traffic over a 2 hour period exceeding this value triggers this alert - Mb/s"
  type        = number
  default     = 10
}

variable "instance_alerts_network_out" {
  description = "Average outbound traffic over a 2 hour period exceeding this value triggers this alert - Mb/s"
  type        = number
  default     = 10
}

variable "instance_alerts_transfer_quota" {
  description = "Percentage of network transfer quota used being greater than this value will trigger this alert - percentage"
  type        = number
  default     = 80
}

variable "instance_alerts_io" {
  description = "Average Disk I/O ops/sec over 2 hours exceeding this value triggers this alert - iops"
  type        = number
  default     = 10000
}

#########################################
# instance - booleans
#########################################

variable "instance_private_ip" {
  description = "Should instance have a private IP address"
  type        = bool
  default     = false
}

variable "instance_resize_disk" {
  description = "Should the instance have a dynamically managed hard disk"
  type        = bool
  default     = false
}

variable "instance_backups_enabled" {
  description = "Should the instance be backed up"
  type        = bool
  default     = false
}

variable "instance_watchdog_enabled" {
  description = "Should the instance be power managed through Lassie"
  type        = bool
  default     = true
}

variable "instance_booted" {
  description = "Should the instance be running"
  type        = bool
  default     = true
}

#########################################
# instance - user authentication
#########################################

variable "instance_authorized_keys" {
  description = "SSH keys to install into instance"
  type        = list(string)
}

#########################################
# firewall
#########################################

variable "firewall_inbound" {
  description = "Inbound rules for instance firewall"
  type        = list(
    object(
      {
        protocol = string
        label    = string
        ports    = string
        ipv4     = list(string)
      }
    )
  )
}
