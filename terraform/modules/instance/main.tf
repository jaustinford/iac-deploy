resource "random_string" "root_password" {
  length = 24
}

resource "linode_instance" "instance" {
  label           = var.instance_label
  image           = var.instance_image
  region          = var.instance_region
  type            = var.instance_type
  authorized_keys = var.instance_keys
  root_pass       = random_string.root_password.id
}
