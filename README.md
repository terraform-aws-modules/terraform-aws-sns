# AWS SNS Topic Terraform module

Terraform module which creates SNS resources on AWS

[![SWUbanner](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/README.md)

## Usage

### Simple Topic

```hcl
module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"

  name  = "simple"

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
```

### Topic w/ SQS Subscription

```hcl
module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"

  name  = "pub-sub"

  topic_policy_statements = {
    pub = {
      actions = ["sns:Publish"]
      principals = [{
        type        = "AWS"
        identifiers = ["arn:aws:iam::66666666666:role/publisher"]
      }]
    },

    sub = {
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
        values   = ["arn:aws:sqs:eu-west-1:11111111111:subscriber"]
      }]
    }
  }

  subscriptions = {
    sqs = {
      protocol = "sqs"
      endpoint = "arn:aws:sqs:eu-west-1:11111111111:subscriber"
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
```

### FIFO Topic w/ FIFO SQS Subscription

```hcl
module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"

  name  = "my-topic"

  # SQS queue must be FIFO as well
  fifo_topic                  = true
  content_based_deduplication = true

  topic_policy_statements = {
    pub = {
      actions = ["sns:Publish"]
      principals = [{
        type        = "AWS"
        identifiers = ["arn:aws:iam::66666666666:role/publisher"]
      }]
    },

    sub = {
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
        values   = ["arn:aws:sqs:eu-west-1:11111111111:subscriber.fifo"]
      }]
    }
  }

  subscriptions = {
    sqs = {
      protocol = "sqs"
      endpoint = "arn:aws:sqs:eu-west-1:11111111111:subscriber.fifo"
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
```

## Examples

- [Complete](https://github.com/terraform-aws-modules/terraform-aws-sns/tree/master/examples/complete)

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

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_data_protection_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_data_protection_policy) | resource |
| [aws_sns_topic_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_subscription.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_feedback"></a> [application\_feedback](#input\_application\_feedback) | Map of IAM role ARNs and sample rate for success and failure feedback | `map(string)` | `{}` | no |
| <a name="input_archive_policy"></a> [archive\_policy](#input\_archive\_policy) | The message archive policy for FIFO topics. | `string` | `null` | no |
| <a name="input_content_based_deduplication"></a> [content\_based\_deduplication](#input\_content\_based\_deduplication) | Boolean indicating whether or not to enable content-based deduplication for FIFO topics. | `bool` | `false` | no |
| <a name="input_create"></a> [create](#input\_create) | Determines whether resources will be created (affects all resources) | `bool` | `true` | no |
| <a name="input_create_subscription"></a> [create\_subscription](#input\_create\_subscription) | Determines whether an SNS subscription is created | `bool` | `true` | no |
| <a name="input_create_topic_policy"></a> [create\_topic\_policy](#input\_create\_topic\_policy) | Determines whether an SNS topic policy is created | `bool` | `true` | no |
| <a name="input_data_protection_policy"></a> [data\_protection\_policy](#input\_data\_protection\_policy) | A map of data protection policy statements | `string` | `null` | no |
| <a name="input_delivery_policy"></a> [delivery\_policy](#input\_delivery\_policy) | The SNS delivery policy | `string` | `null` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name for the SNS topic | `string` | `null` | no |
| <a name="input_enable_default_topic_policy"></a> [enable\_default\_topic\_policy](#input\_enable\_default\_topic\_policy) | Specifies whether to enable the default topic policy. Defaults to `true` | `bool` | `true` | no |
| <a name="input_fifo_topic"></a> [fifo\_topic](#input\_fifo\_topic) | Boolean indicating whether or not to create a FIFO (first-in-first-out) topic | `bool` | `false` | no |
| <a name="input_firehose_feedback"></a> [firehose\_feedback](#input\_firehose\_feedback) | Map of IAM role ARNs and sample rate for success and failure feedback | `map(string)` | `{}` | no |
| <a name="input_http_feedback"></a> [http\_feedback](#input\_http\_feedback) | Map of IAM role ARNs and sample rate for success and failure feedback | `map(string)` | `{}` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK | `string` | `null` | no |
| <a name="input_lambda_feedback"></a> [lambda\_feedback](#input\_lambda\_feedback) | Map of IAM role ARNs and sample rate for success and failure feedback | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the SNS topic to create | `string` | `null` | no |
| <a name="input_override_topic_policy_documents"></a> [override\_topic\_policy\_documents](#input\_override\_topic\_policy\_documents) | List of IAM policy documents that are merged together into the exported document. In merging, statements with non-blank `sid`s will override statements with the same `sid` | `list(string)` | `[]` | no |
| <a name="input_signature_version"></a> [signature\_version](#input\_signature\_version) | If SignatureVersion should be 1 (SHA1) or 2 (SHA256). The signature version corresponds to the hashing algorithm used while creating the signature of the notifications, subscription confirmations, or unsubscribe confirmation messages sent by Amazon SNS. | `number` | `null` | no |
| <a name="input_source_topic_policy_documents"></a> [source\_topic\_policy\_documents](#input\_source\_topic\_policy\_documents) | List of IAM policy documents that are merged together into the exported document. Statements must have unique `sid`s | `list(string)` | `[]` | no |
| <a name="input_sqs_feedback"></a> [sqs\_feedback](#input\_sqs\_feedback) | Map of IAM role ARNs and sample rate for success and failure feedback | `map(string)` | `{}` | no |
| <a name="input_subscriptions"></a> [subscriptions](#input\_subscriptions) | A map of subscription definitions to create | `any` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_topic_policy"></a> [topic\_policy](#input\_topic\_policy) | An externally created fully-formed AWS policy as JSON | `string` | `null` | no |
| <a name="input_topic_policy_statements"></a> [topic\_policy\_statements](#input\_topic\_policy\_statements) | A map of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage | `any` | `{}` | no |
| <a name="input_tracing_config"></a> [tracing\_config](#input\_tracing\_config) | Tracing mode of an Amazon SNS topic. Valid values: PassThrough, Active. | `string` | `null` | no |
| <a name="input_use_name_prefix"></a> [use\_name\_prefix](#input\_use\_name\_prefix) | Determines whether `name` is used as a prefix | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subscriptions"></a> [subscriptions](#output\_subscriptions) | Map of subscriptions created and their attributes |
| <a name="output_topic_arn"></a> [topic\_arn](#output\_topic\_arn) | The ARN of the SNS topic, as a more obvious property (clone of id) |
| <a name="output_topic_beginning_archive_time"></a> [topic\_beginning\_archive\_time](#output\_topic\_beginning\_archive\_time) | The oldest timestamp at which a FIFO topic subscriber can start a replay |
| <a name="output_topic_id"></a> [topic\_id](#output\_topic\_id) | The ARN of the SNS topic |
| <a name="output_topic_name"></a> [topic\_name](#output\_topic\_name) | The name of the topic |
| <a name="output_topic_owner"></a> [topic\_owner](#output\_topic\_owner) | The AWS Account ID of the SNS topic owner |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module is maintained by [Anton Babenko](https://github.com/antonbabenko) with help from [these awesome contributors](https://github.com/terraform-aws-modules/terraform-aws-sns/graphs/contributors).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/terraform-aws-modules/terraform-aws-sns/tree/master/LICENSE) for full details.
