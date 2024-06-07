variable "linode_token" {
  type = string
}

variable "certificate_email" {
  type = string
}

variable "certificate_cn" {
  type = string
}

variable "certificate_sans" {
  type = list(string)
}
