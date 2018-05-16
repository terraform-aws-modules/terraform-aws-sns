# AWS SNS Topic Terraform module

Terraform module which creates SNS resources on AWS

This type of resources are supported:

* [SNS topic] (https://www.terraform.io/docs/providers/aws/r/sns_topic.html)

## Usage

```hcl
module "sns_topic" {
  source = "terraform-aws-modules/sns/aws"
  
  name  = "my-topic"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create_sns_topic | Whether to create the SNS topic | string | `true` | no |
| sns_topic_name | The name of the SNS topic to create | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| this_sns_topic_arn | ARN of SNS topic |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module managed by [Anton Babenko](https://github.com/antonbabenko).

## License

Apache 2 Licensed. See LICENSE for full details.
