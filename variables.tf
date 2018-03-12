variable "create_sns_topic" {
  description = "Whether to create the SNS topic"
  default     = true
}

variable "sns_topic_name" {
  description = "The name of the SNS topic to create"
}
