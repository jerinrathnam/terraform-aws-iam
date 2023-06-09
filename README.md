## Introduction

This Terraform module for AWS IAM (Identity and Access Management) offers a flexible and streamlined approach to managing access control and permissions within your Amazon Web Services (AWS) infrastructure. 

AWS IAM is a critical service for managing user identities, roles, and policies in AWS. It allows you to control and grant fine-grained permissions to AWS resources, ensuring secure and controlled access for users, applications, and services. With the Terraform module for AWS IAM, you can automate the configuration and deployment of IAM resources, enabling consistent and auditable access management across your infrastructure.

This Terraform module simplifies the process of creating and managing IAM resources by providing reusable and configurable components. It abstracts away the complexities of manually creating IAM entities, policies, and roles, allowing you to define them as code and apply changes efficiently.

Using this Terraform module, you can define IAM users, groups, roles, policies, and other entities in a declarative manner. This module offers a comprehensive set of configurable parameters, enabling you to customize IAM resources based on your specific requirements. 

By leveraging this Terraform module, you can enforce security best practices, implement least privilege access, and manage IAM resources as code. This module integrates seamlessly with other Terraform resources and modules, providing a cohesive and scalable approach to managing your entire infrastructure configuration.


## Usage

#### Example of create IAM User with Console access and Programmatic access

```
  module "iam-user" {
    source = "jerinrathnam/iam/aws"

    user_name         = "terraform-user"
    create_user       = true
    create_role       = false
    create_access_key = true
    user_login        = true

    policy_statements = [
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
```

#### Example of create IAM Role with S3 List access

```
  module "iam-role" {
    source = "jerinrathnam/iam/aws"

    name = "terraform-role"

    role_statements = {
      actions = [
        "sts:AssumeRole"
      ]
      effect                 = "Allow"
      principal_type         = "Service"
      assume_role_identities = ["s3.amazonaws.com"]
    }

    policy_statements = [
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
```

## Examples

- [IAM Managed Policies](https://github.com/jerinrathnam/terraform-aws-iam/tree/master/examples/iam-managed-policies)
- [IAM Policy with Conditions](https://github.com/jerinrathnam/terraform-aws-iam/tree/master/examples/iam-policy-with-conditions)
- [IAM Role](https://github.com/jerinrathnam/terraform-aws-iam/tree/master/examples/iam-role)
- [User with Console and Programmatic Access](https://github.com/jerinrathnam/terraform-aws-iam/tree/master/examples/iam-user-console-programmatic-access)
- [User with Group](https://github.com/jerinrathnam/terraform-aws-iam/tree/master/examples/iam-user-with-group)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.64.0 |

## Description

This module will create an IAM Policy, Role, User, User Group, User Access key...

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy) | resource |
| [aws_iam_group_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_login_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_login_profile) | resource |
| [aws_iam_user_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_iam_user_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_user_to_group"></a> [add\_user\_to\_group](#input\_add\_user\_to\_group) | Whether to add users into iam group | `bool` | `false` | no |
| <a name="input_create_access_key"></a> [create\_access\_key](#input\_create\_access\_key) | Whether to create iam user's access key | `bool` | `false` | no |
| <a name="input_create_iam_group"></a> [create\_iam\_group](#input\_create\_iam\_group) | Whether to create iam group | `bool` | `false` | no |
| <a name="input_create_iam_policy"></a> [create\_iam\_policy](#input\_create\_iam\_policy) | Whether to create iam policy | `bool` | `true` | no |
| <a name="input_create_role"></a> [create\_role](#input\_create\_role) | Whether to create iam role | `bool` | `true` | no |
| <a name="input_create_user"></a> [create\_user](#input\_create\_user) | Whether to create iam user | `bool` | `false` | no |
| <a name="input_iam_group_name"></a> [iam\_group\_name](#input\_iam\_group\_name) | Name of the iam group | `string` | `null` | no |
| <a name="input_managed_group_policies"></a> [managed\_group\_policies](#input\_managed\_group\_policies) | List of AWS Managed IAM Policies for Group | `list(string)` | `[]` | no |
| <a name="input_managed_role_policies"></a> [managed\_role\_policies](#input\_managed\_role\_policies) | List of AWS Managed IAM Policies for Role | `list(string)` | `[]` | no |
| <a name="input_managed_user_policies"></a> [managed\_user\_policies](#input\_managed\_user\_policies) | List of AWS Managed IAM Policies for User | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the IAM policy | `string` | `null` | no |
| <a name="input_password_length"></a> [password\_length](#input\_password\_length) | The length of the generated password on resource creation | `number` | `20` | no |
| <a name="input_password_reset_required"></a> [password\_reset\_required](#input\_password\_reset\_required) | Whether the user should be forced to reset the generated password on resource creation. | `bool` | `true` | no |
| <a name="input_path"></a> [path](#input\_path) | path for the resource | `string` | `"/"` | no |
| <a name="input_pgp_key"></a> [pgp\_key](#input\_pgp\_key) | Either a base-64 encoded PGP public key, or a keybase username | `string` | `null` | no |
| <a name="input_role_statements"></a> [role\_statements](#input\_role\_statements) | IAM statements for iam role | <pre>object(<br>    {<br>      effect                 = string<br>      actions                = list(string)<br>      principal_type         = string<br>      assume_role_identities = list(string)<br>    }<br>  )</pre> | <pre>{<br>  "actions": [],<br>  "assume_role_identities": [],<br>  "effect": "",<br>  "principal_type": ""<br>}</pre> | no |
| <a name="input_policy_statements"></a> [policy\_statements](#input\_policy\_statements) | Iam statements for policy | <pre>list(<br>    object(<br>      {<br>        sid       = optional(string)<br>        effect    = string<br>        actions   = list(string)<br>        resources = list(string)<br>        condition = optional(<br>          list(<br>            object(<br>              {<br>                condition_test     = string<br>                condition_variable = string<br>                condition_values   = list(string)<br>              }<br>            )<br>          )<br>        )<br>      }<br>    )<br>  )</pre> | <pre>[<br>  {<br>    "actions": [],<br>    "condition": [<br>      {<br>        "condition_test": null,<br>        "condition_values": [],<br>        "condition_variable": null<br>      }<br>    ],<br>    "effect": "",<br>    "resources": [],<br>    "sid": null<br>  }<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for your infrastructure | `map(string)` | `{}` | no |
| <a name="input_user_login"></a> [user\_login](#input\_user\_login) | Whether to user need to access console login | `bool` | `false` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | Name for the IAM user | `string` | `null` | no |
| <a name="input_users_list"></a> [users\_list](#input\_users\_list) | List of the iam users to attached with group | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_key"></a> [access\_key](#output\_access\_key) | Access key of the user |
| <a name="output_group_arn"></a> [group\_arn](#output\_group\_arn) | ARN of the Iam Group |
| <a name="output_policy_arn"></a> [policy\_arn](#output\_policy\_arn) | ARN of the Iam policy |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | ARN of the Iam role |
| <a name="output_secret_key"></a> [secret\_key](#output\_secret\_key) | Secret key of the user |
| <a name="output_user_login_encrypted_password"></a> [user\_login\_encrypted\_password](#output\_user\_login\_encrypted\_password) | Encrypted Password of the user for console login |
| <a name="output_user_login_key_fingerprint"></a> [user\_login\_key\_fingerprint](#output\_user\_login\_key\_fingerprint) | Key fingerprint of the user for console login |


## Authors
Module is maintained by [Jerin Rathnam](https://github.com/jerinrathnam).

**LinkedIn:**  _[Jerin Rathnam](https://www.linkedin.com/in/jerin-rathnam)_.

## License
Apache 2 Licensed. See [LICENSE](https://github.com/jerinrathnam/terraform-aws-iam/blob/master/LICENSE) for full details.