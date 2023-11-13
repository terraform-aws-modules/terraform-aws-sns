variable "create" {
  description = "Determines whether resources will be created (affects all resources)"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

################################################################################
# Topic
################################################################################

variable "name" {
  description = "The name of the SNS topic to create"
  type        = string
  default     = null
}

variable "use_name_prefix" {
  description = "Determines whether `name` is used as a prefix"
  type        = bool
  default     = false
}

variable "application_feedback" {
  description = "Map of IAM role ARNs and sample rate for success and failure feedback"
  type        = map(string)
  default     = {}
  # Example:
  # application_feedback = {
  #   failure_role_arn = "arn:aws:iam::11111111111:role/failure"
  #   success_role_arn = "arn:aws:iam::11111111111:role/success"
  #   success_sample_rate = 75
  # }
}

variable "content_based_deduplication" {
  description = "Boolean indicating whether or not to enable content-based deduplication for FIFO topics."
  type        = bool
  default     = false
}

variable "delivery_policy" {
  description = "The SNS delivery policy"
  type        = string
  default     = null
}

variable "display_name" {
  description = "The display name for the SNS topic"
  type        = string
  default     = null
}

variable "fifo_topic" {
  description = "Boolean indicating whether or not to create a FIFO (first-in-first-out) topic"
  type        = bool
  default     = false
}

variable "firehose_feedback" {
  description = "Map of IAM role ARNs and sample rate for success and failure feedback"
  type        = map(string)
  default     = {}
  # Example:
  # application_feedback = {
  #   failure_role_arn = "arn:aws:iam::11111111111:role/failure"
  #   success_role_arn = "arn:aws:iam::11111111111:role/success"
  #   success_sample_rate = 75
  # }
}

variable "http_feedback" {
  description = "Map of IAM role ARNs and sample rate for success and failure feedback"
  type        = map(string)
  default     = {}
  # Example:
  # application_feedback = {
  #   failure_role_arn = "arn:aws:iam::11111111111:role/failure"
  #   success_role_arn = "arn:aws:iam::11111111111:role/success"
  #   success_sample_rate = 75
  # }
}

variable "kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK"
  type        = string
  default     = null
}

variable "lambda_feedback" {
  description = "Map of IAM role ARNs and sample rate for success and failure feedback"
  type        = map(string)
  default     = {}
  # Example:
  # application_feedback = {
  #   failure_role_arn = "arn:aws:iam::11111111111:role/failure"
  #   success_role_arn = "arn:aws:iam::11111111111:role/success"
  #   success_sample_rate = 75
  # }
}

variable "topic_policy" {
  description = "An externally created fully-formed AWS policy as JSON"
  type        = string
  default     = null
}

variable "sqs_feedback" {
  description = "Map of IAM role ARNs and sample rate for success and failure feedback"
  type        = map(string)
  default     = {}
  # Example:
  # application_feedback = {
  #   failure_role_arn = "arn:aws:iam::11111111111:role/failure"
  #   success_role_arn = "arn:aws:iam::11111111111:role/success"
  #   success_sample_rate = 75
  # }
}

variable "signature_version" {
  description = "If SignatureVersion should be 1 (SHA1) or 2 (SHA256). The signature version corresponds to the hashing algorithm used while creating the signature of the notifications, subscription confirmations, or unsubscribe confirmation messages sent by Amazon SNS."
  type        = number
  default     = null
}

variable "tracing_config" {
  description = "Tracing mode of an Amazon SNS topic. Valid values: PassThrough, Active."
  type        = string
  default     = null
}

variable "archive_policy" {
  description = "The message archive policy for FIFO topics."
  type        = string
  default     = null
}

################################################################################
# Topic Policy
################################################################################

variable "create_topic_policy" {
  description = "Determines whether an SNS topic policy is created"
  type        = bool
  default     = true
}

variable "source_topic_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. Statements must have unique `sid`s"
  type        = list(string)
  default     = []
}

variable "override_topic_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. In merging, statements with non-blank `sid`s will override statements with the same `sid`"
  type        = list(string)
  default     = []
}

variable "enable_default_topic_policy" {
  description = "Specifies whether to enable the default topic policy. Defaults to `true`"
  type        = bool
  default     = true
}

variable "topic_policy_statements" {
  description = "A map of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage"
  type        = any
  default     = {}
}

################################################################################
# Subscription(s)
################################################################################

variable "create_subscription" {
  description = "Determines whether an SNS subscription is created"
  type        = bool
  default     = true
}

variable "subscriptions" {
  description = "A map of subscription definitions to create"
  type        = any
  default     = {}
}

################################################################################
# Data Protection Policy
################################################################################

variable "data_protection_policy" {
  description = "A map of data protection policy statements"
  type        = string
  default     = null
}
