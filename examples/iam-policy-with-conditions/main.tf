module "iam-policy" {
  source = "../../"

  name              = var.name
  policy_statements = var.policy_statements
  create_role       = false
}