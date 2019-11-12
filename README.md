# AWS SNS Topic Terraform module

Terraform module which creates SNS resources on AWS

This type of resources are supported:

* [SNS topic](https://www.terraform.io/docs/providers/aws/r/sns_topic.html)

## Terraform versions

Terraform 0.12. Pin module version to `~> v2.0`. Submit pull-requests to `master` branch.

Terraform 0.11. Pin module version to `~> v1.0`. Submit pull-requests to `terraform011` branch.

## Usage

```hcl
module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"
  version = "~> 2.0"
  
  name  = "my-topic"
}
```

## Examples

* [Complete SNS topics](https://github.com/terraform-aws-modules/terraform-aws-sns/tree/master/examples/complete)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| application\_failure\_feedback\_role\_arn | IAM role for failure feedback | string | `"null"` | no |
| application\_success\_feedback\_role\_arn | The IAM role permitted to receive success feedback for this topic | string | `"null"` | no |
| application\_success\_feedback\_sample\_rate | Percentage of success to sample | string | `"null"` | no |
| create\_sns\_topic | Whether to create the SNS topic | bool | `"true"` | no |
| delivery\_policy | The SNS delivery policy | string | `"null"` | no |
| display\_name | The display name for the SNS topic | string | `"null"` | no |
| http\_failure\_feedback\_role\_arn | IAM role for failure feedback | string | `"null"` | no |
| http\_success\_feedback\_role\_arn | The IAM role permitted to receive success feedback for this topic | string | `"null"` | no |
| http\_success\_feedback\_sample\_rate | Percentage of success to sample | string | `"null"` | no |
| kms\_master\_key\_id | The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK | string | `"null"` | no |
| lambda\_failure\_feedback\_role\_arn | IAM role for failure feedback | string | `"null"` | no |
| lambda\_success\_feedback\_role\_arn | The IAM role permitted to receive success feedback for this topic | string | `"null"` | no |
| lambda\_success\_feedback\_sample\_rate | Percentage of success to sample | string | `"null"` | no |
| name | The name of the SNS topic to create | string | `"null"` | no |
| name\_prefix | The prefix name of the SNS topic to create | string | `"null"` | no |
| policy | The fully-formed AWS policy as JSON | string | `"null"` | no |
| sqs\_failure\_feedback\_role\_arn | IAM role for failure feedback | string | `"null"` | no |
| sqs\_success\_feedback\_role\_arn | The IAM role permitted to receive success feedback for this topic | string | `"null"` | no |
| sqs\_success\_feedback\_sample\_rate | Percentage of success to sample | string | `"null"` | no |
| tags | A mapping of tags to assign to all resources | map(string) | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_sns\_topic\_arn | ARN of SNS topic |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module managed by [Anton Babenko](https://github.com/antonbabenko).

## License

Apache 2 Licensed. See LICENSE for full details.
