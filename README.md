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
| create_sns_topic | Whether to create the SNS topic | string | `true` | no |
| name | The name of the SNS topic to create | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| this_sns_topic_arn | ARN of SNS topic |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module managed by [Anton Babenko](https://github.com/antonbabenko).

## License

Apache 2 Licensed. See LICENSE for full details.
