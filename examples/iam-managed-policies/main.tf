module "iam-policies" {
  source = "../../"

  name                  = var.name
  create_iam_policy     = false
  managed_role_policies = var.managed_role_policies
  role_statements       = var.role_statements

  create_user           = true
  user_name             = var.user_name
  managed_user_policies = var.managed_user_policies

  create_iam_group       = true
  iam_group_name         = var.iam_group_name
  managed_group_policies = var.managed_group_policies
}