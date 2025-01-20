resource "linode_vpc" "vpc" {
  label       = "${var.vpc_label}-vpc"
  region      = var.vpc_region
  description = var.vpc_description
}

resource "linode_vpc_subnet" "vpc_subnet" {
  vpc_id = linode_vpc.vpc.id
  label  = "${var.vpc_label}-vpc-subnet"
  ipv4   = var.vpc_subnet_ipv4
}
