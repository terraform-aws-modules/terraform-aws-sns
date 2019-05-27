output "static_kms_sns_topic_id" {
  description = "The ARN of the SNS topic (with static KMS key)"
  value       = "${module.users_topic_with_kms_static.this_sns_topic_arn}"
}

output "dynamic_kms_sns_topic_id" {
  description = "The ARN of the SNS topic (with dynamic KMS key)"
  value       = "${module.users_topic_with_kms_dynamic.this_sns_topic_arn}"
}
