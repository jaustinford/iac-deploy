variable "linode_token" {
  type = string
}

variable "instance_label" {
  type = string
}

variable "instance_image" {
  type = string
}

variable "instance_region" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_keys" {
  type = list(string)
}
