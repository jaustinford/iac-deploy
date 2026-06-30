##################################################
# module
##################################################

resource "linode_stackscript" "stackscript" {
  label       = var.stackscript_label
  description = var.stackscript_description
  script      = chomp(file("${path.module}/files/${var.stackscript_script}"))
  images      = var.stackscript_images
}
