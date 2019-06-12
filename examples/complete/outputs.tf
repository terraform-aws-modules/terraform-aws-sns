output "users_unencrypted_this_sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = module.users_unencrypted.this_sns_topic_arn
}

output "users_encrypted_this_sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = module.users_encrypted.this_sns_topic_arn
}
