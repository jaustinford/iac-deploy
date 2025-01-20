output "vpc_id" {
  description = "VPC ID"
  value       = linode_vpc.vpc.id
}

output "vpc_created" {
  description = "VPC created"
  value       = linode_vpc.vpc.created
}

output "vpc_updated" {
  description = "VPC updated"
  value       = linode_vpc.vpc.updated
}

output "vpc_subnet_id" {
  description = "VPC subnet ID"
  value       = linode_vpc_subnet.vpc_subnet.id
}

output "vpc_subnet_linodes" {
  description = "VPC subnet Linodes"
  value       = linode_vpc_subnet.vpc_subnet.linodes
}

output "vpc_subnet_created" {
  description = "VPC subnet created"
  value       = linode_vpc_subnet.vpc_subnet.created
}

output "vpc_subnet_updated" {
  description = "VPC subnet updated"
  value       = linode_vpc_subnet.vpc_subnet.updated
}
