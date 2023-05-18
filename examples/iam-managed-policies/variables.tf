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
    actions                = ["sts:AssumeRole"]
    effect                 = "Allow"
    principal_type         = "Service"
    assume_role_identities = ["s3.amazonaws.com"]
  }
}

variable "iam_group_name" {
  type        = string
  description = "Name of the iam group"
  default     = "terraform-group"
}

variable "managed_group_policies" {
  type        = list(string)
  description = "List of AWS Managed IAM Policies for Group"
  default     = []
}

variable "managed_role_policies" {
  type        = list(string)
  description = "List of AWS Managed IAM Policies for Role"
  default     = []
}

variable "managed_user_policies" {
  type        = list(string)
  description = "List of AWS Managed IAM Policies for User"
  default     = []
}