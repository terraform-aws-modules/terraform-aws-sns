output "sns_topic_arn" {
  description = "ARN of SNS topic"
  value       = element(concat(aws_sns_topic.this.*.arn, [""]), 0)
}

output "sns_topic_name" {
  description = "name of SNS topic"
  value       = element(concat(aws_sns_topic.this.*.name, [""]), 0)
}

output "sns_topic_id" {
  description = "id of SNS topic"
  value       = element(concat(aws_sns_topic.this.*.id, [""]), 0)
}

output "sns_topic_owner" {
  description = "owner of SNS topic"
  value       = element(concat(aws_sns_topic.this.*.owner, [""]), 0)
}
