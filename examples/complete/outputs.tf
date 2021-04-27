output "users_unencrypted_sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = module.users_unencrypted.sns_topic_arn
}

output "users_encrypted_sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = module.users_encrypted.sns_topic_arn
}
