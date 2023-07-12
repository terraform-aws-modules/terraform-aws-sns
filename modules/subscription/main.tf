resource "aws_sns_topic_subscription" "this" {
  confirmation_timeout_in_minutes = var.confirmation_timeout_in_minutes
  delivery_policy                 = var.delivery_policy
  endpoint                        = var.endpoint
  endpoint_auto_confirms          = var.endpoint_auto_confirms
  filter_policy                   = var.filter_policy
  filter_policy_scope             = var.filter_policy_scope
  protocol                        = var.protocol
  raw_message_delivery            = var.raw_message_delivery
  redrive_policy                  = var.redrive_policy
  subscription_role_arn           = var.subscription_role_arn
  topic_arn                       = var.topic_arn
}