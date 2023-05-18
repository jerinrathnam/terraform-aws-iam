module "iam-role" {
  source = "../../"

  name              = var.name
  role_statements   = var.role_statements
  policy_statements = var.policy_statements
}