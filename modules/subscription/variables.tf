variable "confirmation_timeout_in_minutes" {
  description = "(Optional) Integer indicating number of minutes to wait in retrying mode for fetching subscription arn before marking it as failure. Only applicable for http and https protocols. Default is 1."
  type        = number
  default     = 1
}
variable "delivery_policy" {
  description = "(Optional) JSON String with the delivery policy (retries, backoff, etc.) that will be used in the subscription - this only applies to HTTP/S subscriptions. Refer to the SNS docs for more details."
  type        = string
  default     = null
}
variable "endpoint" {
  description = "(Required) Endpoint to send data to. The contents vary with the protocol. See details below."
  type        = string
}
variable "endpoint_auto_confirms" {
  description = "(Optional) Whether the endpoint is capable of auto confirming subscription (e.g., PagerDuty). Default is false."
  type        = bool
  default     = false
}
variable "filter_policy" {
  description = "(Optional) JSON String with the filter policy that will be used in the subscription to filter messages seen by the target resource. Refer to the SNS docs for more details."
  type        = string
  default     = null
}
variable "filter_policy_scope" {
  description = "(Optional) Whether the filter_policy applies to MessageAttributes (default) or MessageBody."
  type        = string
  default     = "MessageAttributes"
}
variable "protocol" {
  description = "(Required) Protocol to use. Valid values are: sqs, sms, lambda, firehose, and application. Protocols email, email-json, http and https are also valid but partially supported."
  type        = string
  default     = null
}
variable "raw_message_delivery" {
  description = "(Optional) Whether to enable raw message delivery (the original message is directly passed, not wrapped in JSON with the original message in the message property). Default is false."
  type        = bool
  default     = false
}
variable "redrive_policy" {
  description = "(Optional) JSON String with the redrive policy that will be used in the subscription. Refer to the SNS docs for more details."
  type        = string
  default     = null
}
variable "subscription_role_arn" {
  description = "(Required if protocol is firehose) ARN of the IAM role to publish to Kinesis Data Firehose delivery stream. Refer to SNS docs."
  type        = string
  default     = null
}
variable "topic_arn" {
  description = "(Required) ARN of the SNS topic to subscribe to."
  type        = string
}
