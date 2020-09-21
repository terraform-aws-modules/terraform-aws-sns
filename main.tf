data "aws_iam_policy_document" "this" {
  # dont create this if no services or iam arns are specified
  count = length(concat(var.allow_publish_aws_services, var.allow_publish_iam_arns)) > 0 ? 1 : 0
  statement {
    effect    = "Allow"
    actions   = ["sns:Publish"]
    resources = ["*"]

    dynamic principals {
      for_each = length(var.allow_publish_aws_services) > 0 ? ["_enable"] : []
      content {
        type        = "Service"
        identifiers = var.allow_publish_aws_services
      }
    }

    dynamic principals {
      for_each = length(var.allow_publish_iam_arns) > 0 ? ["_enable"] : []
      content {
        type        = "AWS"
        identifiers = var.allow_publish_iam_arns
      }
    }
  }
}



resource "aws_sns_topic" "this" {
  count = var.create_sns_topic ? 1 : 0

  name        = var.name
  name_prefix = var.name_prefix

  display_name                             = var.display_name
  policy                                   = length(var.policy) > 0 ? var.policy : try(data.aws_iam_policy_document.this[0].json, null)
  delivery_policy                          = var.delivery_policy
  application_success_feedback_role_arn    = var.application_success_feedback_role_arn
  application_success_feedback_sample_rate = var.application_success_feedback_sample_rate
  application_failure_feedback_role_arn    = var.application_failure_feedback_role_arn
  http_success_feedback_role_arn           = var.http_success_feedback_role_arn
  http_success_feedback_sample_rate        = var.http_success_feedback_sample_rate
  http_failure_feedback_role_arn           = var.http_failure_feedback_role_arn
  lambda_success_feedback_role_arn         = var.lambda_success_feedback_role_arn
  lambda_success_feedback_sample_rate      = var.lambda_success_feedback_sample_rate
  lambda_failure_feedback_role_arn         = var.lambda_failure_feedback_role_arn
  sqs_success_feedback_role_arn            = var.sqs_success_feedback_role_arn
  sqs_success_feedback_sample_rate         = var.sqs_success_feedback_sample_rate
  sqs_failure_feedback_role_arn            = var.sqs_failure_feedback_role_arn
  kms_master_key_id                        = var.kms_master_key_id

  tags = var.tags
}
