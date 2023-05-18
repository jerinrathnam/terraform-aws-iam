module "iam-user" {
  source = "../../"

  create_role       = false
  create_user       = true
  create_access_key = true
  user_login        = true
  policy_statements = var.policy_statements
  user_name         = var.user_name
  name              = var.name
}

output "access_key" {
  description = "Access key of the user"
  value       = module.iam-user.access_key
}

output "secret_key" {
  description = "Secret key of the user"
  value       = module.iam-user.secret_key
}

output "login_password" {
  description = "Encrypted Password of the user for console login"
  value       = one([module.iam-user.user_login_encrypted_password])
}