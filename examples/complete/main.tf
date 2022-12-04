provider "aws" {
  region = local.region
}

data "aws_caller_identity" "current" {}

locals {
  region = "eu-west-1"
  name   = "sns-ex-${replace(basename(path.cwd), "_", "-")}"

  tags = {
    Name       = local.name
    Example    = "complete"
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-sns"
  }
}

################################################################################
# SNS Module
################################################################################

module "default_sns" {
  source = "../../"

  name = "sns-ex-default"

  tags = local.tags
}

module "complete_sns" {
  source = "../../"

  name              = "sns-ex-complete-"
  use_name_prefix   = true
  display_name      = "complete"
  kms_master_key_id = module.kms.key_id

  # SQS queue must be FIFO as well
  fifo_topic                  = true
  content_based_deduplication = true

  delivery_policy = jsonencode({
    "http" : {
      "defaultHealthyRetryPolicy" : {
        "minDelayTarget" : 20,
        "maxDelayTarget" : 20,
        "numRetries" : 3,
        "numMaxDelayRetries" : 0,
        "numNoDelayRetries" : 0,
        "numMinDelayRetries" : 0,
        "backoffFunction" : "linear"
      },
      "disableSubscriptionOverrides" : false,
      "defaultThrottlePolicy" : {
        "maxReceivesPerSecond" : 1
      }
    }
  })

  create_topic_policy         = true
  enable_default_topic_policy = true
  topic_policy_statements = {
    pub = {
      actions = ["sns:Publish"]
      principals = [{
        type        = "AWS"
        identifiers = [data.aws_caller_identity.current.arn]
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
        values   = [aws_sqs_queue.this.arn]
      }]
    }
  }

  subscriptions = {
    sqs = {
      protocol = "sqs"
      endpoint = aws_sqs_queue.this.arn
    }
  }

  # Feedback
  application_feedback = {
    failure_role_arn    = aws_iam_role.this.arn
    success_role_arn    = aws_iam_role.this.arn
    success_sample_rate = 100
  }
  firehose_feedback = {
    failure_role_arn    = aws_iam_role.this.arn
    success_role_arn    = aws_iam_role.this.arn
    success_sample_rate = 100
  }
  http_feedback = {
    failure_role_arn    = aws_iam_role.this.arn
    success_role_arn    = aws_iam_role.this.arn
    success_sample_rate = 100
  }
  lambda_feedback = {
    failure_role_arn    = aws_iam_role.this.arn
    success_role_arn    = aws_iam_role.this.arn
    success_sample_rate = 100
  }
  sqs_feedback = {
    failure_role_arn    = aws_iam_role.this.arn
    success_role_arn    = aws_iam_role.this.arn
    success_sample_rate = 100
  }

  tags = local.tags
}

module "disabled_sns" {
  source = "../../"

  create = false
}

################################################################################
# Supporting Resources
################################################################################

module "kms" {
  source = "terraform-aws-modules/kms/aws"

  aliases     = ["sns/example"]
  description = "KMS key to encrypt topic"

  # Policy
  key_statements = [
    {
      sid = "SNS"
      actions = [
        "kms:GenerateDataKey*",
        "kms:Decrypt"
      ]
      resources = ["*"]
      principals = [{
        type        = "Service"
        identifiers = ["sns.amazonaws.com"]
      }]
    }
  ]

  tags = local.tags
}

# TODO - replace once SQS module has been updated for policy/etc.
resource "aws_sqs_queue" "this" {
  name = "${local.name}.fifo"

  # Since SNS topic is FIFO
  fifo_queue                  = true
  content_based_deduplication = true

  tags = local.tags
}

resource "aws_iam_role" "this" {
  name = local.name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "SnsAssume"
        Principal = {
          Service = "sns.amazonaws.com"
        }
      },
    ]
  })

  inline_policy {
    name = local.name

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents",
            "logs:PutMetricFilter",
            "logs:PutRetentionPolicy",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
    })
  }

  tags = local.tags
}
