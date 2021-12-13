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
