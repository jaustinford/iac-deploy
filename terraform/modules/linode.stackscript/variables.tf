##################################################
# module
##################################################

variable "stackscript_label" {
  type        = string
  description = "Label for StackScript"
}

variable "stackscript_description" {
  type        = string
  description = "Description for StackScript"
}

variable "stackscript_script" {
  type        = string
  description = "Script for StackScript"
  default     = "ubuntu.sh"
}

variable "stackscript_images" {
  type        = list(string)
  description = "Images for StackScript"
}
