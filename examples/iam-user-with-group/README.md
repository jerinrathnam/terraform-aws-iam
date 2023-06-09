## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam-role"></a> [iam-role](#module\_iam-role) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_group_name"></a> [iam\_group\_name](#input\_iam\_group\_name) | Name of the iam group | `string` | `"Infra-management"` | no |
| <a name="input_policy_statements"></a> [policy\_statements](#input\_policy\_statements) | Iam statements for policy | <pre>list(<br>    object(<br>      {<br>        sid       = optional(string)<br>        effect    = string<br>        actions   = list(string)<br>        resources = list(string)<br>        condition = optional(<br>          list(<br>            object(<br>              {<br>                condition_test     = string<br>                condition_variable = string<br>                condition_values   = list(string)<br>              }<br>            )<br>          )<br>        )<br>      }<br>    )<br>  )</pre> | <pre>[<br>  {<br>    "actions": [<br>      "s3:ListBucket",<br>      "s3:ListAllMyBuckets"<br>    ],<br>    "effect": "Allow",<br>    "resources": [<br>      "*"<br>    ],<br>    "sid": "S3ListAccess"<br>  }<br>]</pre> | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | Name for the IAM user | `string` | `"terraform-user"` | no |

## Outputs

No outputs.
