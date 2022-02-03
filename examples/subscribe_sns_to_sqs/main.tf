module "sqs_queue" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "~> 3.0"

  name = local.sqs_name
}

module "sns_topic" {
  # source  = "terraform-aws-modules/sns/aws"
  # version = "~> 3.0"
  source = "../../"

  name = local.sns_name

  create_sns_topic_subscription = true
  endpoint                      = module.sqs_queue.sqs_queue_arn
  protocol                      = local.sns_protocol
  topic_arn                     = module.sns_topic.sns_topic_arn
  raw_message_delivery          = local.sns_raw_message_delivery
}
