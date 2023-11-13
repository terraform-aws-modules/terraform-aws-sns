################################################################################
# Default
################################################################################

output "default_sns_topic_arn" {
  description = "The ARN of the SNS topic, as a more obvious property (clone of id)"
  value       = module.default_sns.topic_arn
}

output "default_sns_topic_id" {
  description = "The ARN of the SNS topic"
  value       = module.default_sns.topic_id
}

output "default_sns_topic_name" {
  description = "The name of the topic"
  value       = module.default_sns.topic_name
}

output "default_sns_topic_owner" {
  description = "The AWS Account ID of the SNS topic owner"
  value       = module.default_sns.topic_owner
}

output "default_sns_topic_beginning_archive_time" {
  description = "The oldest timestamp at which a FIFO topic subscriber can start a replay"
  value       = module.default_sns.topic_beginning_archive_time
}

output "default_sns_subscriptions" {
  description = "Map of subscriptions created and their attributes"
  value       = module.default_sns.subscriptions
}

################################################################################
# Complete
################################################################################

output "complete_sns_topic_arn" {
  description = "The ARN of the SNS topic, as a more obvious property (clone of id)"
  value       = module.complete_sns.topic_arn
}

output "complete_sns_topic_id" {
  description = "The ARN of the SNS topic"
  value       = module.complete_sns.topic_id
}

output "complete_sns_topic_name" {
  description = "The name of the topic"
  value       = module.complete_sns.topic_name
}

output "complete_sns_topic_owner" {
  description = "The AWS Account ID of the SNS topic owner"
  value       = module.complete_sns.topic_owner
}

output "complete_sns_topic_beginning_archive_time" {
  description = "The oldest timestamp at which a FIFO topic subscriber can start a replay"
  value       = module.complete_sns.topic_beginning_archive_time
}

output "complete_sns_subscriptions" {
  description = "Map of subscriptions created and their attributes"
  value       = module.complete_sns.subscriptions
}
