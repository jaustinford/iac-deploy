variable "linode_token" {
  type = string
}

variable "instance_labels" {
  type = list(string)
}

variable "firewall_ingresses" {
  type = list(
    object (
      {
        name          = string
        external_port = string
        sources       = list(string)
      }
    )
  )
}
