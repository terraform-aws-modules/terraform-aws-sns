# AWS SNS Topic Terraform module

Terraform module which creates SNS resources on AWS

This type of resources are supported:

* [SNS topic](https://www.terraform.io/docs/providers/aws/r/sns_topic.html)

## Usage

```hcl
module "sns_topic" {
  source = "terraform-aws-modules/sns/aws"
  
  sns_topic_name  = "my-topic"
}
```


## Examples

* [Simple SNS topic](https://github.com/terraform-aws-modules/terraform-aws-sns/tree/master/examples/simple-sns)
* [SNS topic with KMS encryption](https://github.com/terraform-aws-modules/terraform-aws-sns/tree/master/examples/sns-with-kms)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create\_sns\_topic | Whether to create the SNS topic | string | `"true"` | no |
| delivery\_policy | The JSON delivery policy for the SNS topic | string | `""` | no |
| kms\_master\_key\_id | The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK | string | `""` | no |
| policy | The JSON policy for the SNS topic | string | `""` | no |
| sns\_topic\_name | The name of the SNS topic to create. If omitted, Terraform will assign a random name. | string | `""` | no |
| sns\_topic\_with\_kms | Whether to create SNS topic with KMS encryption | string | `"false"` | no |
| tags | A mapping of tags to assign to all resources | map | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_sns\_topic\_arn | ARN of SNS topic |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module managed by [Anton Babenko](https://github.com/antonbabenko).

## License

Apache 2 Licensed. See LICENSE for full details.
