variable "name" {
  type        = string
  description = "Name for the IAM policy"
  default     = "terraform-policy"
}

variable "user_name" {
  type        = string
  description = "Name for the IAM user"
  default     = "terraform-user"
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

variable "pgp_key" {
  type        = string
  description = "Either a base-64 encoded PGP public key, or a keybase username"
  default     = null
}

variable "password_length" {
  type        = number
  description = "The length of the generated password on resource creation"
  default     = 20
}

variable "password_reset_required" {
  type        = bool
  description = "Whether the user should be forced to reset the generated password on resource creation."
  default     = true
}

variable "iam_group_name" {
  type        = string
  description = "Name of the iam group"
  default     = "terraform-group"
}