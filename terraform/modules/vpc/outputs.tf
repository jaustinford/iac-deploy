output "vpc_id" {
  value = linode_vpc.vpc.id
}

output "vpc_created" {
  value = linode_vpc.vpc.created
}

output "vpc_updated" {
  value = linode_vpc.vpc.updated
}

output "vpc_subnet_id" {
  value = linode_vpc_subnet.vpc_subnet.id
}

output "vpc_subnet_linodes" {
  value = linode_vpc_subnet.vpc_subnet.linodes
}

output "vpc_subnet_created" {
  value = linode_vpc_subnet.vpc_subnet.created
}

output "vpc_subnet_updated" {
  value = linode_vpc_subnet.vpc_subnet.updated
}
