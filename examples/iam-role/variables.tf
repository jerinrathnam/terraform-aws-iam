variable "name" {
  type        = string
  description = "Name of the IAM Role"
  default     = "terraform-role"
}

variable "role_statements" {
  type = object(
    {
      effect                 = string
      actions                = list(string)
      principal_type         = string
      assume_role_identities = list(string)
    }
  )
  description = "IAM statements for iam role"
  default = {
    actions = [
      "sts:AssumeRole"
    ]
    effect                 = "Allow"
    principal_type         = "Service"
    assume_role_identities = ["s3.amazonaws.com"]
  }
}

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

