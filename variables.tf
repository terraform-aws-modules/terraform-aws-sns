variable "create_sns_topic" {
  description = "Whether to create the SNS topic"
  default     = true
}

variable "sns_topic_name" {
  description = "The name of the SNS topic to create. If omitted, Terraform will assign a random name."
  default     = ""
}

variable "policy" {
  description = "The JSON policy for the SNS topic"
  default     = ""
}

variable "delivery_policy" {
  description = "The JSON delivery policy for the SNS topic"
  default     = ""
}

variable "sns_topic_with_kms" {
  description = "Whether to create SNS topic with KMS encryption"
  default     = false
}

variable "kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK"
  default     = ""
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  default     = {}
}
