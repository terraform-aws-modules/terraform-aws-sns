################################################################################
# Topic
################################################################################

output "topic_arn" {
  description = "The ARN of the SNS topic, as a more obvious property (clone of id)"
  value       = try(aws_sns_topic.this[0].arn, "")
}

output "topic_id" {
  description = "The ARN of the SNS topic"
  value       = try(aws_sns_topic.this[0].id, "")
}

output "topic_name" {
  description = "The name of the topic"
  value       = try(aws_sns_topic.this[0].name, "")
}

output "topic_owner" {
  description = "The AWS Account ID of the SNS topic owner"
  value       = try(aws_sns_topic.this[0].owner, "")
}

################################################################################
# Subscription(s)
################################################################################

output "subscriptions" {
  description = "Map of subscriptions created and their attributes"
  value       = aws_sns_topic_subscription.this
}
