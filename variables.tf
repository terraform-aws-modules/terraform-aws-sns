variable "create_sns_topic" {
  description = "Whether to create the SNS topic"
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the SNS topic to create"
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "The prefix name of the SNS topic to create"
  type        = string
  default     = null
}

variable "display_name" {
  description = "The display name for the SNS topic"
  type        = string
  default     = null
}

variable "policy" {
  description = "The fully-formed AWS policy as JSON"
  type        = string
  default     = null
}

variable "delivery_policy" {
  description = "The SNS delivery policy"
  type        = string
  default     = null
}

variable "application_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "application_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "application_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "http_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "http_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "http_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "lambda_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "lambda_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "lambda_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "sqs_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "sqs_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "sqs_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK"
  type        = string
  default     = null
}

variable "fifo_topic" {
  description = "Boolean indicating whether or not to create a FIFO (first-in-first-out) topic"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}

variable "content_based_deduplication" {
  description = "Boolean indicating whether or not to enable content-based deduplication for FIFO topics."
  type        = bool
  default     = false
}

variable "create_sns_topic_subscription" {
  description = "Whether to create the SNS topic subscription"
  type        = bool
  default     = false
}

variable "endpoint" {
  description = "Endpoint to send data to"
  type        = string
  default     = null
}

variable "protocol" {
  description = "Protocol to use"
  type        = string
  default     = null
}

variable "topic_arn" {
  description = "ARN of the SNS topic to subscribe to"
  type        = string
  default     = null
}

variable "confirmation_timeout_in_minutes" {
  description = "Integer indicating number of minutes to wait in retrying mode for fetching subscription arn before marking it as failure"
  type        = number
  default     = 1
}

# variable "delivery_policy" {
#   description = "JSON String with the delivery policy (retries, backoff, etc.) that will be used in the subscription"
#   type        = string
#   default     = null
# }

variable "endpoint_auto_confirms" {
  description = "Whether the endpoint is capable of auto confirming subscription"
  type        = bool
  default     = false
}

variable "filter_policy" {
  description = "JSON String with the filter policy that will be used in the subscription to filter messages seen by the target resource"
  type        = string
  default     = null
}

variable "raw_message_delivery" {
  description = "Whether to enable raw message delivery"
  type        = bool
  default     = false
}

variable "redrive_policy" {
  description = "JSON String with the redrive policy that will be used in the subscription"
  type        = string
  default     = null
}
