## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam-user"></a> [iam-user](#module\_iam-user) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_group_name"></a> [iam\_group\_name](#input\_iam\_group\_name) | Name of the iam group | `string` | `"terraform-group"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the IAM policy | `string` | `"terraform-policy"` | no |
| <a name="input_password_length"></a> [password\_length](#input\_password\_length) | The length of the generated password on resource creation | `number` | `20` | no |
| <a name="input_password_reset_required"></a> [password\_reset\_required](#input\_password\_reset\_required) | Whether the user should be forced to reset the generated password on resource creation. | `bool` | `true` | no |
| <a name="input_pgp_key"></a> [pgp\_key](#input\_pgp\_key) | Either a base-64 encoded PGP public key, or a keybase username | `string` | `null` | no |
| <a name="input_policy_statements"></a> [policy\_statements](#input\_policy\_statements) | Iam statements for policy | <pre>list(<br>    object(<br>      {<br>        sid       = optional(string)<br>        effect    = string<br>        actions   = list(string)<br>        resources = list(string)<br>        condition = optional(<br>          list(<br>            object(<br>              {<br>                condition_test     = string<br>                condition_variable = string<br>                condition_values   = list(string)<br>              }<br>            )<br>          )<br>        )<br>      }<br>    )<br>  )</pre> | <pre>[<br>  {<br>    "actions": [<br>      "s3:ListBucket",<br>      "s3:ListAllMyBuckets"<br>    ],<br>    "effect": "Allow",<br>    "resources": [<br>      "*"<br>    ],<br>    "sid": "S3ListAccess"<br>  }<br>]</pre> | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | Name for the IAM user | `string` | `"terraform-user"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_key"></a> [access\_key](#output\_access\_key) | Access key of the user |
| <a name="output_login_password"></a> [login\_password](#output\_login\_password) | Encrypted Password of the user for console login |
| <a name="output_secret_key"></a> [secret\_key](#output\_secret\_key) | Secret key of the user |
