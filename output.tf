output "sns_topic_arn" {
  description = "ARN of sns topic"
  value       = "${element(concat(aws_sns_topic.this.*.arn, list("")), 0)}"
}

