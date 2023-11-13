# Complete SNS topic example

Configuration in this directory creates:
- A simple, default SNS topic
- A FIFO SNS topic with FIFO SQS subscription; shows most of the supported arguments
- A disabled SNS topic

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.25 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.25 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_complete_sns"></a> [complete\_sns](#module\_complete\_sns) | ../../ | n/a |
| <a name="module_default_sns"></a> [default\_sns](#module\_default\_sns) | ../../ | n/a |
| <a name="module_disabled_sns"></a> [disabled\_sns](#module\_disabled\_sns) | ../../ | n/a |
| <a name="module_kms"></a> [kms](#module\_kms) | terraform-aws-modules/kms/aws | ~> 1.0 |
| <a name="module_sqs"></a> [sqs](#module\_sqs) | terraform-aws-modules/sqs/aws | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_complete_sns_subscriptions"></a> [complete\_sns\_subscriptions](#output\_complete\_sns\_subscriptions) | Map of subscriptions created and their attributes |
| <a name="output_complete_sns_topic_arn"></a> [complete\_sns\_topic\_arn](#output\_complete\_sns\_topic\_arn) | The ARN of the SNS topic, as a more obvious property (clone of id) |
| <a name="output_complete_sns_topic_beginning_archive_time"></a> [complete\_sns\_topic\_beginning\_archive\_time](#output\_complete\_sns\_topic\_beginning\_archive\_time) | The oldest timestamp at which a FIFO topic subscriber can start a replay |
| <a name="output_complete_sns_topic_id"></a> [complete\_sns\_topic\_id](#output\_complete\_sns\_topic\_id) | The ARN of the SNS topic |
| <a name="output_complete_sns_topic_name"></a> [complete\_sns\_topic\_name](#output\_complete\_sns\_topic\_name) | The name of the topic |
| <a name="output_complete_sns_topic_owner"></a> [complete\_sns\_topic\_owner](#output\_complete\_sns\_topic\_owner) | The AWS Account ID of the SNS topic owner |
| <a name="output_default_sns_subscriptions"></a> [default\_sns\_subscriptions](#output\_default\_sns\_subscriptions) | Map of subscriptions created and their attributes |
| <a name="output_default_sns_topic_arn"></a> [default\_sns\_topic\_arn](#output\_default\_sns\_topic\_arn) | The ARN of the SNS topic, as a more obvious property (clone of id) |
| <a name="output_default_sns_topic_beginning_archive_time"></a> [default\_sns\_topic\_beginning\_archive\_time](#output\_default\_sns\_topic\_beginning\_archive\_time) | The oldest timestamp at which a FIFO topic subscriber can start a replay |
| <a name="output_default_sns_topic_id"></a> [default\_sns\_topic\_id](#output\_default\_sns\_topic\_id) | The ARN of the SNS topic |
| <a name="output_default_sns_topic_name"></a> [default\_sns\_topic\_name](#output\_default\_sns\_topic\_name) | The name of the topic |
| <a name="output_default_sns_topic_owner"></a> [default\_sns\_topic\_owner](#output\_default\_sns\_topic\_owner) | The AWS Account ID of the SNS topic owner |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
