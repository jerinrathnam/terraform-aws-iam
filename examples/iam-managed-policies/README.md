## Requirements

No requirements.

## Providers

No providers.

## Description

This is an example for Creating IAM Role, User, Group and attached IAM managed policies with their respective types...

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam-policies"></a> [iam-policies](#module\_iam-policies) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_group_name"></a> [iam\_group\_name](#input\_iam\_group\_name) | Name of the iam group | `string` | `"terraform-group"` | no |
| <a name="input_managed_group_policies"></a> [managed\_group\_policies](#input\_managed\_group\_policies) | List of AWS Managed IAM Policies for Group | `list(string)` | `[]` | no |
| <a name="input_managed_role_policies"></a> [managed\_role\_policies](#input\_managed\_role\_policies) | List of AWS Managed IAM Policies for Role | `list(string)` | `[]` | no |
| <a name="input_managed_user_policies"></a> [managed\_user\_policies](#input\_managed\_user\_policies) | List of AWS Managed IAM Policies for User | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the IAM policy | `string` | `"terraform-policy"` | no |
| <a name="input_role_statements"></a> [role\_statements](#input\_role\_statements) | IAM statements for iam role | <pre>object(<br>    {<br>      effect                 = string<br>      actions                = list(string)<br>      principal_type         = string<br>      assume_role_identities = list(string)<br>    }<br>  )</pre> | <pre>{<br>  "actions": [<br>    "sts:AssumeRole"<br>  ],<br>  "assume_role_identities": [<br>    "s3.amazonaws.com"<br>  ],<br>  "effect": "Allow",<br>  "principal_type": "Service"<br>}</pre> | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | Name for the IAM user | `string` | `"terraform-user"` | no |

## Outputs

No outputs.
