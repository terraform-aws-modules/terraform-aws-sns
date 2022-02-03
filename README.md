# AWS SNS Topic Terraform module

Terraform module which creates SNS resources on AWS

## Usage

```hcl
module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"
  version = "~> 3.0"

  name  = "my-topic"
}
```

## Examples

- [Complete SNS topics](https://github.com/terraform-aws-modules/terraform-aws-sns/tree/master/examples/complete)
- [Subscribe SNS topic to SQS queue](https://github.com/terraform-aws-modules/terraform-aws-sns/tree/master/examples/subscribe_sns_to_sqs)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.37 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.37 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_failure_feedback_role_arn"></a> [application\_failure\_feedback\_role\_arn](#input\_application\_failure\_feedback\_role\_arn) | IAM role for failure feedback | `string` | `null` | no |
| <a name="input_application_success_feedback_role_arn"></a> [application\_success\_feedback\_role\_arn](#input\_application\_success\_feedback\_role\_arn) | The IAM role permitted to receive success feedback for this topic | `string` | `null` | no |
| <a name="input_application_success_feedback_sample_rate"></a> [application\_success\_feedback\_sample\_rate](#input\_application\_success\_feedback\_sample\_rate) | Percentage of success to sample | `string` | `null` | no |
| <a name="input_confirmation_timeout_in_minutes"></a> [confirmation\_timeout\_in\_minutes](#input\_confirmation\_timeout\_in\_minutes) | Integer indicating number of minutes to wait in retrying mode for fetching subscription arn before marking it as failure | `number` | `1` | no |
| <a name="input_content_based_deduplication"></a> [content\_based\_deduplication](#input\_content\_based\_deduplication) | Boolean indicating whether or not to enable content-based deduplication for FIFO topics. | `bool` | `false` | no |
| <a name="input_create_sns_topic"></a> [create\_sns\_topic](#input\_create\_sns\_topic) | Whether to create the SNS topic | `bool` | `true` | no |
| <a name="input_create_sns_topic_subscription"></a> [create\_sns\_topic\_subscription](#input\_create\_sns\_topic\_subscription) | Whether to create the SNS topic subscription | `bool` | `false` | no |
| <a name="input_delivery_policy"></a> [delivery\_policy](#input\_delivery\_policy) | The SNS delivery policy | `string` | `null` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name for the SNS topic | `string` | `null` | no |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Endpoint to send data to | `string` | `null` | no |
| <a name="input_endpoint_auto_confirms"></a> [endpoint\_auto\_confirms](#input\_endpoint\_auto\_confirms) | Whether the endpoint is capable of auto confirming subscription | `bool` | `false` | no |
| <a name="input_fifo_topic"></a> [fifo\_topic](#input\_fifo\_topic) | Boolean indicating whether or not to create a FIFO (first-in-first-out) topic | `bool` | `false` | no |
| <a name="input_filter_policy"></a> [filter\_policy](#input\_filter\_policy) | JSON String with the filter policy that will be used in the subscription to filter messages seen by the target resource | `string` | `null` | no |
| <a name="input_http_failure_feedback_role_arn"></a> [http\_failure\_feedback\_role\_arn](#input\_http\_failure\_feedback\_role\_arn) | IAM role for failure feedback | `string` | `null` | no |
| <a name="input_http_success_feedback_role_arn"></a> [http\_success\_feedback\_role\_arn](#input\_http\_success\_feedback\_role\_arn) | The IAM role permitted to receive success feedback for this topic | `string` | `null` | no |
| <a name="input_http_success_feedback_sample_rate"></a> [http\_success\_feedback\_sample\_rate](#input\_http\_success\_feedback\_sample\_rate) | Percentage of success to sample | `string` | `null` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK | `string` | `null` | no |
| <a name="input_lambda_failure_feedback_role_arn"></a> [lambda\_failure\_feedback\_role\_arn](#input\_lambda\_failure\_feedback\_role\_arn) | IAM role for failure feedback | `string` | `null` | no |
| <a name="input_lambda_success_feedback_role_arn"></a> [lambda\_success\_feedback\_role\_arn](#input\_lambda\_success\_feedback\_role\_arn) | The IAM role permitted to receive success feedback for this topic | `string` | `null` | no |
| <a name="input_lambda_success_feedback_sample_rate"></a> [lambda\_success\_feedback\_sample\_rate](#input\_lambda\_success\_feedback\_sample\_rate) | Percentage of success to sample | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the SNS topic to create | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | The prefix name of the SNS topic to create | `string` | `null` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | The fully-formed AWS policy as JSON | `string` | `null` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Protocol to use | `string` | `null` | no |
| <a name="input_raw_message_delivery"></a> [raw\_message\_delivery](#input\_raw\_message\_delivery) | Whether to enable raw message delivery | `bool` | `false` | no |
| <a name="input_redrive_policy"></a> [redrive\_policy](#input\_redrive\_policy) | JSON String with the redrive policy that will be used in the subscription | `string` | `null` | no |
| <a name="input_sqs_failure_feedback_role_arn"></a> [sqs\_failure\_feedback\_role\_arn](#input\_sqs\_failure\_feedback\_role\_arn) | IAM role for failure feedback | `string` | `null` | no |
| <a name="input_sqs_success_feedback_role_arn"></a> [sqs\_success\_feedback\_role\_arn](#input\_sqs\_success\_feedback\_role\_arn) | The IAM role permitted to receive success feedback for this topic | `string` | `null` | no |
| <a name="input_sqs_success_feedback_sample_rate"></a> [sqs\_success\_feedback\_sample\_rate](#input\_sqs\_success\_feedback\_sample\_rate) | Percentage of success to sample | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |
| <a name="input_topic_arn"></a> [topic\_arn](#input\_topic\_arn) | ARN of the SNS topic to subscribe to | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sns_topic_arn"></a> [sns\_topic\_arn](#output\_sns\_topic\_arn) | ARN of SNS topic |
| <a name="output_sns_topic_id"></a> [sns\_topic\_id](#output\_sns\_topic\_id) | ID of SNS topic |
| <a name="output_sns_topic_name"></a> [sns\_topic\_name](#output\_sns\_topic\_name) | NAME of SNS topic |
| <a name="output_sns_topic_owner"></a> [sns\_topic\_owner](#output\_sns\_topic\_owner) | OWNER of SNS topic |
| <a name="output_sns_topic_subscription_arn"></a> [sns\_topic\_subscription\_arn](#output\_sns\_topic\_subscription\_arn) | ARN of the subscription |
| <a name="output_sns_topic_subscription_confirmation_was_authenticated"></a> [sns\_topic\_subscription\_confirmation\_was\_authenticated](#output\_sns\_topic\_subscription\_confirmation\_was\_authenticated) | Whether the subscription confirmation request was authenticated |
| <a name="output_sns_topic_subscription_id"></a> [sns\_topic\_subscription\_id](#output\_sns\_topic\_subscription\_id) | ID of the subscription |
| <a name="output_sns_topic_subscription_owner_id"></a> [sns\_topic\_subscription\_owner\_id](#output\_sns\_topic\_subscription\_owner\_id) | AWS account ID of the subscription's owner |
| <a name="output_sns_topic_subscription_pending_confirmation"></a> [sns\_topic\_subscription\_pending\_confirmation](#output\_sns\_topic\_subscription\_pending\_confirmation) | Whether the subscription has not been confirmed |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module is maintained by [Anton Babenko](https://github.com/antonbabenko) with help from [these awesome contributors](https://github.com/terraform-aws-modules/terraform-aws-sns/graphs/contributors).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/terraform-aws-modules/terraform-aws-sns/tree/master/LICENSE) for full details.
