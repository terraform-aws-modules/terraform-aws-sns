# Subscribe SNS topic to SQS queue

Configuration in this directory will subscribe an SNS topic to an SQS queue.

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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.37 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sns_topic"></a> [sns\_topic](#module\_sns\_topic) | ../../ | n/a |
| <a name="module_sqs_queue"></a> [sqs\_queue](#module\_sqs\_queue) | terraform-aws-modules/sqs/aws | ~> 3.0 |

## Resources

No resources.

## Inputs

No inputs.

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
| <a name="output_sqs_queue_arn"></a> [sqs\_queue\_arn](#output\_sqs\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_sqs_queue_id"></a> [sqs\_queue\_id](#output\_sqs\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_sqs_queue_name"></a> [sqs\_queue\_name](#output\_sqs\_queue\_name) | The name of the SQS queue |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
