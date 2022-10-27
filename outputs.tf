output "sns_topic_arn" {
  description = "ARN of SNS topic"
  value       = try(aws_sns_topic.this[0].arn, "")
}

output "sns_topic_name" {
  description = "NAME of SNS topic"
  value       = try(aws_sns_topic.this[0].name, "")
}

output "sns_topic_id" {
  description = "ID of SNS topic"
  value       = try(aws_sns_topic.this[0].id, "")
}

output "sns_topic_owner" {
  description = "OWNER of SNS topic"
  value       = try(aws_sns_topic.this[0].owner, "")
}
