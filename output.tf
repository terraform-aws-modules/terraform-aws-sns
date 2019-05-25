output "this_sns_topic_arn" {
  description = "ARN of SNS topic"
  value       = "${element(concat(aws_sns_topic.this.*.arn,aws_sns_topic.this_with_kms.*.arn, list("")), 0)}"
}
