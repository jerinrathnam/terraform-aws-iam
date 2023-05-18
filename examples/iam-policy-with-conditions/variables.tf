variable "name" {
  type        = string
  description = "Name of the IAM policy"
  default     = "terraform-policy"
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
      condition = [
        {
          condition_test     = "StringNotEquals"
          condition_values   = ["aws:kms"]
          condition_variable = "s3:x-amz-server-side-encryption"
        }
      ]
    }
  ]
}

