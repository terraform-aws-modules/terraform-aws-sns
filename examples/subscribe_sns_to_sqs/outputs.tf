output "sqs_queue_id" {
  value       = module.sqs_queue.sqs_queue_id
  description = "The URL for the created Amazon SQS queue"
}

output "sqs_queue_arn" {
  value       = module.sqs_queue.sqs_queue_arn
  description = "The ARN of the SQS queue"
}

output "sqs_queue_name" {
  value       = module.sqs_queue.sqs_queue_name
  description = "The name of the SQS queue"
}

output "sns_topic_arn" {
  value       = module.sns_topic.sns_topic_arn
  description = "ARN of SNS topic"
}

output "sns_topic_name" {
  value       = module.sns_topic.sns_topic_name
  description = "NAME of SNS topic"
}

output "sns_topic_id" {
  value       = module.sns_topic.sns_topic_id
  description = "ID of SNS topic"
}

output "sns_topic_owner" {
  value       = module.sns_topic.sns_topic_owner
  description = "OWNER of SNS topic"
}

output "sns_topic_subscription_arn" {
  value       = module.sns_topic.sns_topic_subscription_arn
  description = "ARN of the subscription"
}

output "sns_topic_subscription_confirmation_was_authenticated" {
  value       = module.sns_topic.sns_topic_subscription_confirmation_was_authenticated
  description = "Whether the subscription confirmation request was authenticated"
}

output "sns_topic_subscription_id" {
  value       = module.sns_topic.sns_topic_subscription_id
  description = "ID of the subscription"
}

output "sns_topic_subscription_owner_id" {
  value       = module.sns_topic.sns_topic_subscription_owner_id
  description = "AWS account ID of the subscription's owner"
}

output "sns_topic_subscription_pending_confirmation" {
  value       = module.sns_topic.sns_topic_subscription_pending_confirmation
  description = "Whether the subscription has not been confirmed"
}
