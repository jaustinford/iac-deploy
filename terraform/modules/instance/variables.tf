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

variable "instance_label" {
  description = "Attach labels to Linode resource"
  type        = string
}

variable "instance_image" {
  description = "Image to run on instance"
  type        = string
  default     = "linode/ubuntu22.04"
}

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

variable "instance_authorized_keys" {
  description = "SSH keys to install into instance"
  type        = list(string)
}

variable "instance_private_ip" {
  description = "Should instance have a private IP"
  type        = bool
  default     = false
}

variable "instance_booted" {
  description = "Should the instance be running"
  type        = bool
  default     = true
}

variable "firewall_inbound" {
  description = "Inbound rules for firewall"
  type        = list(
    object(
      {
        name          = string
        external_port = string
        sources       = list(string)
      }
    )
  )
}
