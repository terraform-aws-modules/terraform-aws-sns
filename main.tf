data "aws_caller_identity" "current" {
  count = var.create && var.create_topic_policy ? 1 : 0
}

################################################################################
# Topic
################################################################################

locals {
  name = try(trimsuffix(var.name, ".fifo"), "")
}

resource "aws_sns_topic" "this" {
  count = var.create ? 1 : 0

  region = var.region

  name        = var.use_name_prefix ? null : (var.fifo_topic ? "${local.name}.fifo" : local.name)
  name_prefix = var.use_name_prefix ? "${local.name}-" : null

  application_failure_feedback_role_arn    = var.application_feedback.failure_role_arn
  application_success_feedback_role_arn    = var.application_feedback.success_role_arn
  application_success_feedback_sample_rate = var.application_feedback.success_sample_rate

  content_based_deduplication = var.content_based_deduplication
  delivery_policy             = var.delivery_policy
  display_name                = var.display_name
  fifo_throughput_scope       = var.fifo_throughput_scope
  fifo_topic                  = var.fifo_topic
  signature_version           = var.fifo_topic ? null : var.signature_version
  tracing_config              = var.tracing_config

  firehose_failure_feedback_role_arn    = var.firehose_feedback.failure_role_arn
  firehose_success_feedback_role_arn    = var.firehose_feedback.success_role_arn
  firehose_success_feedback_sample_rate = var.firehose_feedback.success_sample_rate

  http_failure_feedback_role_arn    = var.http_feedback.failure_role_arn
  http_success_feedback_role_arn    = var.http_feedback.success_role_arn
  http_success_feedback_sample_rate = var.http_feedback.success_sample_rate

  kms_master_key_id = var.kms_master_key_id

  lambda_failure_feedback_role_arn    = var.lambda_feedback.failure_role_arn
  lambda_success_feedback_role_arn    = var.lambda_feedback.success_role_arn
  lambda_success_feedback_sample_rate = var.lambda_feedback.success_sample_rate

  policy = var.create_topic_policy ? null : var.topic_policy

  sqs_failure_feedback_role_arn    = var.sqs_feedback.failure_role_arn
  sqs_success_feedback_role_arn    = var.sqs_feedback.success_role_arn
  sqs_success_feedback_sample_rate = var.sqs_feedback.success_sample_rate

  archive_policy = var.archive_policy

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
      sid = "DefaultStatementID"
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
        values   = [data.aws_caller_identity.current[0].account_id]
        variable = "AWS:SourceAccount"
      }
    }
  }

  dynamic "statement" {
    for_each = var.topic_policy_statements != null ? var.topic_policy_statements : {}

    content {
      sid         = try(coalesce(statement.value.sid, statement.key))
      actions     = statement.value.actions
      not_actions = statement.value.not_actions
      effect      = statement.value.effect
      # This avoids the chicken vs the egg scenario since its embedded and can reference the topic
      resources     = statement.value.resources != null ? statement.value.resources : [aws_sns_topic.this[0].arn]
      not_resources = statement.value.not_resources

      dynamic "principals" {
        for_each = statement.value.principals != null ? statement.value.principals : []

        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }

      dynamic "not_principals" {
        for_each = statement.value.not_principals != null ? statement.value.not_principals : []

        content {
          type        = not_principals.value.type
          identifiers = not_principals.value.identifiers
        }
      }

      dynamic "condition" {
        for_each = statement.value.condition != null ? statement.value.condition : []

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

  region = var.region

  arn    = aws_sns_topic.this[0].arn
  policy = data.aws_iam_policy_document.this[0].json
}

################################################################################
# Subscription(s)
################################################################################

resource "aws_sns_topic_subscription" "this" {
  for_each = { for k, v in var.subscriptions : k => v if var.create && var.create_subscription }

  region = var.region

  confirmation_timeout_in_minutes = each.value.confirmation_timeout_in_minutes
  delivery_policy                 = each.value.delivery_policy
  endpoint                        = each.value.endpoint
  endpoint_auto_confirms          = each.value.endpoint_auto_confirms
  filter_policy                   = each.value.filter_policy
  filter_policy_scope             = each.value.filter_policy_scope
  protocol                        = each.value.protocol
  raw_message_delivery            = each.value.raw_message_delivery
  redrive_policy                  = each.value.redrive_policy
  replay_policy                   = each.value.replay_policy
  subscription_role_arn           = each.value.subscription_role_arn
  topic_arn                       = aws_sns_topic.this[0].arn
}

################################################################################
# Data Protection Policy
################################################################################

resource "aws_sns_topic_data_protection_policy" "this" {
  count = var.create && var.data_protection_policy != null && !var.fifo_topic ? 1 : 0

  region = var.region

  arn    = aws_sns_topic.this[0].arn
  policy = var.data_protection_policy
}
