data "aws_iam_policy_document" "this" {
  # dont create the document if we don't need to (simplify plan output)
  count = var.create_sns_topic ? 1 : 0

  statement {
    effect    = "Allow"
    actions   = ["sns:Publish"]
    resources = ["*"]

    dynamic "principals" {
      for_each = length(var.allow_publish_aws_services) > 0 ? [true] : []
      content {
        type        = "Service"
        identifiers = var.allow_publish_aws_services
      }
    }

    dynamic "principals" {
      for_each = length(var.allow_publish_iam_arns) > 0 ? [true] : []
      content {
        type        = "AWS"
        identifiers = var.allow_publish_iam_arns
      }
    }
  }
}

locals {
  # an iam policy doc with an empty `principals` means var.allow_publish_* were empty
  policy_doc_is_valid = length(data.aws_iam_policy_document.this[0].statement[0].principals) > 0

  # we only want to use our policy doc if it's valid and var.policy is null
  use_policy_doc = local.policy_doc_is_valid && var.policy == null
}

resource "aws_sns_topic" "this" {
  count = var.create_sns_topic ? 1 : 0

  name        = var.name
  name_prefix = var.name_prefix

  display_name                             = var.display_name
  policy                                   = local.use_policy_doc ? data.aws_iam_policy_document.this[0].json : var.policy
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
