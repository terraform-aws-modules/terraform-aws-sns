output "this_sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = "${module.users_topic.this_sns_topic_arn}"
}
