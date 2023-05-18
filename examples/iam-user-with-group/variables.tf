variable "policy_statements" {
  type = list(
    object(
      {
        sid       = optional(string)
        effect    = string
        actions   = list(string)
        resources = list(string)
        condition = optional(
          list(
            object(
              {
                condition_test     = string
                condition_variable = string
                condition_values   = list(string)
              }
            )
          )
        )
      }
    )
  )
  description = "Iam statements for policy"
  default = [
    {
      sid = "S3ListAccess"
      actions = [
        "s3:ListBucket",
        "s3:ListAllMyBuckets"
      ]
      effect = "Allow"
      resources = [
        "*"
      ]
    }
  ]
}

variable "user_name" {
  type        = string
  description = "Name for the IAM user"
  default     = "terraform-user"
}


variable "iam_group_name" {
  type        = string
  description = "Name of the iam group"
  default     = "Infra-management"
}
