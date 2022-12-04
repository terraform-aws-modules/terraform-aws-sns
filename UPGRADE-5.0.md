# Upgrade from v4.x to v5.x

If you have any questions regarding this upgrade process, please consult the [`examples`](https://github.com/terraform-aws-modules/terraform-aws-sns/tree/master/examples/complete) directory:

If you find a bug, please open an issue with supporting configuration to reproduce.

## List of backwards incompatible changes

- `create_sns_topic` has been renamed to `create`
- `policy` has been renamed to `topic_policy`
- `name_prefix` has been replaced with the combination of `name` and `use_name_prefix = true` to ensure only one value is provided
- `*_failure_feedback_role_arn`, `*_success_feedback_role_arn`, `*_success_feedback_sample_rate` variables have been replaced with a respective top level variable that contains a map to the three attributes. See before and after below for further clarification.
- Outputs have had the `sns_` prefix stripped from their names

## Additional changes

### Added

- Support for topic policy creation and subscriptions

### Variable and output changes

1. Removed variables:

    - None

2. Renamed variables:

    - `create_sns_topic` -> `create`
    - `policy` -> `topic_policy`
    - `application_feedback_failure_role_arn`/`application_feedback_success_role_arn`/`application_feedback_success_feedback_sample_rate` -> `application_feedback`
    - `firehose_feedback_failure_role_arn`/`firehose_feedback_success_role_arn`/`firehose_feedback_success_feedback_sample_rate` -> `firehose_feedback`
    - `http_feedback_failure_role_arn`/`http_feedback_success_role_arn`/`http_feedback_success_feedback_sample_rate` -> `http_feedback`
    - `lambda_feedback_failure_role_arn`/`lambda_feedback_success_role_arn`/`lambda_feedback_success_feedback_sample_rate` -> `lambda_feedback`
    - `sqs_feedback_failure_role_arn`/`sqs_feedback_success_role_arn`/`sqs_feedback_success_feedback_sample_rate` -> `sqs_feedback`

3. Added variables:

    - `use_name_prefix`
    - `create_topic_policy`
    - `source_topic_policy_documents`
    - `override_topic_policy_documents`
    - `enable_default_topic_policy`
    - `topic_policy_statements`
    - `create_subscription`
    - `subscriptions`

4. Removed outputs:

    - None

5. Renamed outputs:

    - `sns_` prefix removed from all outputs

6. Added outputs:

    - `subscriptions`

## Upgrade Migrations

Note: Only the affected attributes are shown below for brevity.

### Before 4.x Example

```hcl
module "sns" {
  source  = "terraform-aws-modules/sns/aws"
  version = "~> 4.0"

  create_sns_topic = true

  name_prefix = "example-"
  policy      = "..."

  application_feedback_failure_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:application"
  application_feedback_success_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:application"
  application_feedback_success_sample_rate = 100

  firehose_feedback_failure_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:firehose"
  firehose_feedback_success_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:firehose"
  firehose_feedback_success_sample_rate = 100

  http_feedback_failure_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:http"
  http_feedback_success_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:http"
  http_feedback_success_sample_rate = 100

  lambda_feedback = {
  lambda_feedback_failure_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:lambda"
  lambda_feedback_success_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:lambda"
  lambda_feedback_success_sample_rate = 100

  sqs_feedback_failure_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:sqs"
  sqs_feedback_success_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:sqs"
  sqs_feedback_success_sample_rate = 100
}
```

### After 5.x Example

```hcl
module "sns" {
  source  = "terraform-aws-modules/sns/aws"
  version = "~> 5.0"

  create = true

  name            = "example-"
  use_name_prefix = true
  topic_policy    = "..."

  application_feedback = {
    failure_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:application"
    success_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:application"
    success_sample_rate = 100
  }
  firehose_feedback = {
    failure_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:firehose"
    success_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:firehose"
    success_sample_rate = 100
  }
  http_feedback = {
    failure_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:http"
    success_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:http"
    success_sample_rate = 100
  }
  lambda_feedback = {
    failure_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:lambda"
    success_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:lambda"
    success_sample_rate = 100
  }
  sqs_feedback = {
    failure_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:sqs"
    success_role_arn    = "arn:aws:sqs:eu-west-1:11111111111:sqs"
    success_sample_rate = 100
  }
}
```

### State Changes

No state changes required.
