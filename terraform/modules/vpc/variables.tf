variable "vpc_label" {
  type        = string
  description = "Name of VPC"
}

variable "vpc_region" {
  type        = string
  description = "Region of VPC"
  default     = "us-ord"

  validation {
    condition = contains(
      concat(
        local.vpc_regions.north_america,
        local.vpc_regions.asia,
        local.vpc_regions.europe,
        local.vpc_regions.oceania,
        local.vpc_regions.south_america
      ),
      var.vpc_region
    )

    error_message = "Region value is incorrect"
  }
}

variable "vpc_description" {
  type        = string
  description = "Description of VPC"
  default     = "US, Chicago, IL ( us-ord )"
}

variable "vpc_subnet_ipv4" {
  type        = string
  description = "IPv4 for VPC subnet"
}
