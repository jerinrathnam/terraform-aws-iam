module "iam-role" {
  source = "../../"

  user_name         = var.user_name
  create_user       = true
  create_role       = false
  create_iam_group  = true
  add_user_to_group = true
  policy_statements = var.policy_statements
  iam_group_name    = var.iam_group_name
}