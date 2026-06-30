output "stackscript_id" {
  description = "StackScript ID"
  value       = linode_stackscript.stackscript.id
}

output "stackscript_deployments_active" {
  description = "Number of active deployments using StackScript"
  value       = linode_stackscript.stackscript.deployments_active
}

output "stackscript_created" {
  description = "When StackScript was created"
  value       = linode_stackscript.stackscript.created
}
