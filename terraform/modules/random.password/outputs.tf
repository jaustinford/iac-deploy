output "password_result" {
  description = "Result of random password"
  value       = random_password.password.result
  sensitive   = true
}
