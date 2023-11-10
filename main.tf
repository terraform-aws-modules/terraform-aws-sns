data "aws_caller_identity" "current" {}

################################################################################
# Topic
################################################################################

resource "aws_sns_topic" "this" {
  count = var.create ? 1 : 0

  name        = var.use_name_prefix ? null : var.name
  name_prefix = var.use_name_prefix ? var.name : null

  application_failure_feedback_role_arn    = try(var.application_feedback.failure_role_arn, null)
  application_success_feedback_role_arn    = try(var.application_feedback.success_role_arn, null)
  application_success_feedback_sample_rate = try(var.application_feedback.success_sample_rate, null)

  content_based_deduplication = var.content_based_deduplication
  delivery_policy             = var.delivery_policy
  display_name                = var.display_name
  fifo_topic                  = var.fifo_topic
  signature_version           = var.fifo_topic ? null : var.signature_version
  tracing_config              = var.tracing_config

  firehose_failure_feedback_role_arn    = try(var.firehose_feedback.failure_role_arn, null)
  firehose_success_feedback_role_arn    = try(var.firehose_feedback.success_role_arn, null)
  firehose_success_feedback_sample_rate = try(var.firehose_feedback.success_sample_rate, null)

  http_failure_feedback_role_arn    = try(var.http_feedback.failure_role_arn, null)
  http_success_feedback_role_arn    = try(var.http_feedback.success_role_arn, null)
  http_success_feedback_sample_rate = try(var.http_feedback.success_sample_rate, null)

  kms_master_key_id = var.kms_master_key_id

  lambda_failure_feedback_role_arn    = try(var.lambda_feedback.failure_role_arn, null)
  lambda_success_feedback_role_arn    = try(var.lambda_feedback.success_role_arn, null)
  lambda_success_feedback_sample_rate = try(var.lambda_feedback.success_sample_rate, null)

  policy = var.create_topic_policy ? null : var.topic_policy

  sqs_failure_feedback_role_arn    = try(var.sqs_feedback.failure_role_arn, null)
  sqs_success_feedback_role_arn    = try(var.sqs_feedback.success_role_arn, null)
  sqs_success_feedback_sample_rate = try(var.sqs_feedback.success_sample_rate, null)

  archive_policy = try(var.archive_policy, null)

  tags = var.tags
}

################################################################################
# Topic Policy
################################################################################

data "aws_iam_policy_document" "this" {
  count = var.create && var.create_topic_policy ? 1 : 0

  source_policy_documents   = var.source_topic_policy_documents
  override_policy_documents = var.override_topic_policy_documents

  dynamic "statement" {
    for_each = var.enable_default_topic_policy ? [1] : []

    content {
      sid = "__default_statement_ID"
      actions = [
        "sns:Subscribe",
        "sns:SetTopicAttributes",
        "sns:RemovePermission",
        "sns:Publish",
        "sns:ListSubscriptionsByTopic",
        "sns:GetTopicAttributes",
        "sns:DeleteTopic",
        "sns:AddPermission",
      ]
      effect    = "Allow"
      resources = [aws_sns_topic.this[0].arn]

      principals {
        type        = "AWS"
        identifiers = ["*"]
      }

      condition {
        test     = "StringEquals"
        values   = [data.aws_caller_identity.current.account_id]
        variable = "AWS:SourceOwner"
      }
    }
  }

  dynamic "statement" {
    for_each = var.topic_policy_statements

    content {
      sid         = try(statement.value.sid, statement.key)
      actions     = try(statement.value.actions, null)
      not_actions = try(statement.value.not_actions, null)
      effect      = try(statement.value.effect, null)
      # This avoids the chicken vs the egg scenario since its embedded and can reference the topic
      resources     = try(statement.value.resources, [aws_sns_topic.this[0].arn])
      not_resources = try(statement.value.not_resources, null)

      dynamic "principals" {
        for_each = try(statement.value.principals, [])

        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }

      dynamic "not_principals" {
        for_each = try(statement.value.not_principals, [])

        content {
          type        = not_principals.value.type
          identifiers = not_principals.value.identifiers
        }
      }

      dynamic "condition" {
        for_each = try(statement.value.conditions, [])

        content {
          test     = condition.value.test
          values   = condition.value.values
          variable = condition.value.variable
        }
      }
    }
  }
}

resource "aws_sns_topic_policy" "this" {
  count = var.create && var.create_topic_policy ? 1 : 0

  arn    = aws_sns_topic.this[0].arn
  policy = data.aws_iam_policy_document.this[0].json
}

################################################################################
# Subscription(s)
################################################################################

resource "aws_sns_topic_subscription" "this" {
  for_each = { for k, v in var.subscriptions : k => v if var.create && var.create_subscription }

  confirmation_timeout_in_minutes = try(each.value.confirmation_timeout_in_minutes, null)
  delivery_policy                 = try(each.value.delivery_policy, null)
  endpoint                        = each.value.endpoint
  endpoint_auto_confirms          = try(each.value.endpoint_auto_confirms, null)
  filter_policy                   = try(each.value.filter_policy, null)
  filter_policy_scope             = try(each.value.filter_policy_scope, null)
  protocol                        = each.value.protocol
  raw_message_delivery            = try(each.value.raw_message_delivery, null)
  redrive_policy                  = try(each.value.redrive_policy, null)
  replay_policy                   = try(each.value.replay_policy, null)
  subscription_role_arn           = try(each.value.subscription_role_arn, null)
  topic_arn                       = aws_sns_topic.this[0].arn
}

################################################################################
# Data Protection Policy
################################################################################

resource "aws_sns_topic_data_protection_policy" "this" {
  count = var.create && var.data_protection_policy != null && !var.fifo_topic ? 1 : 0

  arn    = aws_sns_topic.this[0].arn
  policy = var.data_protection_policy
}
