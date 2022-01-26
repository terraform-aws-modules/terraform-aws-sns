output "sns_topic_arn" {
  description = "ARN of SNS topic"
  value       = element(concat(aws_sns_topic.this.*.arn, [""]), 0)
}

output "sns_topic_name" {
  description = "NAME of SNS topic"
  value       = element(concat(aws_sns_topic.this.*.name, [""]), 0)
}

output "sns_topic_id" {
  description = "ID of SNS topic"
  value       = element(concat(aws_sns_topic.this.*.id, [""]), 0)
}

output "sns_topic_owner" {
  description = "OWNER of SNS topic"
  value       = element(concat(aws_sns_topic.this.*.owner, [""]), 0)
}

output "sns_topic_subscription_arn" {
  description = "ARN of the subscription"
  value       = element(concat(aws_sns_topic_subscription.this.*.arn, [""]), 0)
}

output "sns_topic_subscription_confirmation_was_authenticated" {
  description = "Whether the subscription confirmation request was authenticated"
  value       = element(concat(aws_sns_topic_subscription.this.*.confirmation_was_authenticated, [""]), 0)
}

output "sns_topic_subscription_id" {
  description = "ID of the subscription"
  value       = element(concat(aws_sns_topic_subscription.this.*.id, [""]), 0)
}

output "sns_topic_subscription_owner_id" {
  description = "AWS account ID of the subscription's owner"
  value       = element(concat(aws_sns_topic_subscription.this.*.owner_id, [""]), 0)
}

output "sns_topic_subscription_pending_confirmation" {
  description = "Whether the subscription has not been confirmed"
  value       = element(concat(aws_sns_topic_subscription.this.*.pending_confirmation, [""]), 0)
}
