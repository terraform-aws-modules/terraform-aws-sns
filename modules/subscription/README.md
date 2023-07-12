# AWS Subscription SNS Topic Terraform module

Terraform module which creates SNS Subscription resources on AWS

[![SWUbanner](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/README.md)

## Usage

### Simple Subscribe SQS to SNS Topic

```hcl
module "sns" {
  source  = "terraform-aws-modules/sns/aws"

  name = "pub-sub"

  topic_policy_statements = {
    sqs = {
      sid = "SQSSubscribe"
      actions = [
        "sns:Subscribe",
        "sns:Receive",
      ]

      principals = [{
        type        = "AWS"
        identifiers = ["*"]
      }]

      conditions = [{
        test     = "StringLike"
        variable = "sns:Endpoint"
        values   = [module.sqs.queue_arn]
      }]
    }
  }


  tags = {
    Environment = "dev"
  }
}

module "sqs" {
  source = "terraform-aws-modules/sqs/aws"

  name = "pub-sub"

  create_queue_policy = true
  queue_policy_statements = {
    sns = {
      sid     = "SNSPublish"
      actions = ["sqs:SendMessage"]

      principals = [
        {
          type        = "Service"
          identifiers = ["sns.amazonaws.com"]
        }
      ]

      conditions = [{
        test     = "ArnEquals"
        variable = "aws:SourceArn"
        values   = [module.sns.topic_arn]
      }]
    }
  }

  tags = {
    Environment = "dev"
  }
}

module "sns_subscription" {
  source  = "terraform-aws-modules/sns/aws//modules/subscription"

  protocol = "sqs"
  endpoint = module.sqs.queue_arn
}
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.62 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic_subscription.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_confirmation_timeout_in_minutes"></a> [confirmation\_timeout\_in\_minutes](#input\_confirmation\_timeout\_in\_minutes) | (Optional) Integer indicating number of minutes to wait in retrying mode for fetching subscription arn before marking it as failure. Only applicable for http and https protocols. Default is 1. | `number` | `1` | no |
| <a name="input_delivery_policy"></a> [delivery\_policy](#input\_delivery\_policy) | (Optional) JSON String with the delivery policy (retries, backoff, etc.) that will be used in the subscription - this only applies to HTTP/S subscriptions. Refer to the SNS docs for more details. | `string` | `null` | no |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | (Required) Endpoint to send data to. The contents vary with the protocol. See details below. | `string` | n/a | yes |
| <a name="input_endpoint_auto_confirms"></a> [endpoint\_auto\_confirms](#input\_endpoint\_auto\_confirms) | (Optional) Whether the endpoint is capable of auto confirming subscription (e.g., PagerDuty). Default is false. | `bool` | `false` | no |
| <a name="input_filter_policy"></a> [filter\_policy](#input\_filter\_policy) | (Optional) JSON String with the filter policy that will be used in the subscription to filter messages seen by the target resource. Refer to the SNS docs for more details. | `string` | `null` | no |
| <a name="input_filter_policy_scope"></a> [filter\_policy\_scope](#input\_filter\_policy\_scope) | (Optional) Whether the filter\_policy applies to MessageAttributes (default) or MessageBody. | `string` | `"MessageAttributes"` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | (Required) Protocol to use. Valid values are: sqs, sms, lambda, firehose, and application. Protocols email, email-json, http and https are also valid but partially supported. | `string` | `null` | no |
| <a name="input_raw_message_delivery"></a> [raw\_message\_delivery](#input\_raw\_message\_delivery) | (Optional) Whether to enable raw message delivery (the original message is directly passed, not wrapped in JSON with the original message in the message property). Default is false. | `bool` | `false` | no |
| <a name="input_redrive_policy"></a> [redrive\_policy](#input\_redrive\_policy) | (Optional) JSON String with the redrive policy that will be used in the subscription. Refer to the SNS docs for more details. | `string` | `null` | no |
| <a name="input_subscription_role_arn"></a> [subscription\_role\_arn](#input\_subscription\_role\_arn) | (Required if protocol is firehose) ARN of the IAM role to publish to Kinesis Data Firehose delivery stream. Refer to SNS docs. | `string` | `null` | no |
| <a name="input_topic_arn"></a> [topic\_arn](#input\_topic\_arn) | (Required) ARN of the SNS topic to subscribe to. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subscription"></a> [subscription](#output\_subscription) | Map of subscriptions created and their attributes |
