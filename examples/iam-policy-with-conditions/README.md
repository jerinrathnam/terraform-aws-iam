## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam-policy"></a> [iam-policy](#module\_iam-policy) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the IAM policy | `string` | `"terraform-policy"` | no |
| <a name="input_policy_statements"></a> [policy\_statements](#input\_policy\_statements) | Iam statements for policy | <pre>list(<br>    object(<br>      {<br>        sid       = optional(string)<br>        effect    = string<br>        actions   = list(string)<br>        resources = list(string)<br>        condition = optional(<br>          list(<br>            object(<br>              {<br>                condition_test     = string<br>                condition_variable = string<br>                condition_values   = list(string)<br>              }<br>            )<br>          )<br>        )<br>      }<br>    )<br>  )</pre> | <pre>[<br>  {<br>    "actions": [<br>      "s3:ListBucket",<br>      "s3:ListAllMyBuckets"<br>    ],<br>    "condition": [<br>      {<br>        "condition_test": "StringNotEquals",<br>        "condition_values": [<br>          "aws:kms"<br>        ],<br>        "condition_variable": "s3:x-amz-server-side-encryption"<br>      }<br>    ],<br>    "effect": "Allow",<br>    "resources": [<br>      "*"<br>    ],<br>    "sid": "S3ListAccess"<br>  }<br>]</pre> | no |

## Outputs

No outputs.
