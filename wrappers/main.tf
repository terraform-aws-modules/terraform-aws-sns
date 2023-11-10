module "wrapper" {
  source = "../"

  for_each = var.items

  create                          = try(each.value.create, var.defaults.create, true)
  tags                            = try(each.value.tags, var.defaults.tags, {})
  name                            = try(each.value.name, var.defaults.name, null)
  use_name_prefix                 = try(each.value.use_name_prefix, var.defaults.use_name_prefix, false)
  application_feedback            = try(each.value.application_feedback, var.defaults.application_feedback, {})
  content_based_deduplication     = try(each.value.content_based_deduplication, var.defaults.content_based_deduplication, false)
  delivery_policy                 = try(each.value.delivery_policy, var.defaults.delivery_policy, null)
  display_name                    = try(each.value.display_name, var.defaults.display_name, null)
  fifo_topic                      = try(each.value.fifo_topic, var.defaults.fifo_topic, false)
  firehose_feedback               = try(each.value.firehose_feedback, var.defaults.firehose_feedback, {})
  http_feedback                   = try(each.value.http_feedback, var.defaults.http_feedback, {})
  kms_master_key_id               = try(each.value.kms_master_key_id, var.defaults.kms_master_key_id, null)
  lambda_feedback                 = try(each.value.lambda_feedback, var.defaults.lambda_feedback, {})
  topic_policy                    = try(each.value.topic_policy, var.defaults.topic_policy, null)
  sqs_feedback                    = try(each.value.sqs_feedback, var.defaults.sqs_feedback, {})
  signature_version               = try(each.value.signature_version, var.defaults.signature_version, null)
  tracing_config                  = try(each.value.tracing_config, var.defaults.tracing_config, null)
  archive_policy                  = try(each.value.archive_policy, var.defaults.archive_policy, null)
  create_topic_policy             = try(each.value.create_topic_policy, var.defaults.create_topic_policy, true)
  source_topic_policy_documents   = try(each.value.source_topic_policy_documents, var.defaults.source_topic_policy_documents, [])
  override_topic_policy_documents = try(each.value.override_topic_policy_documents, var.defaults.override_topic_policy_documents, [])
  enable_default_topic_policy     = try(each.value.enable_default_topic_policy, var.defaults.enable_default_topic_policy, true)
  topic_policy_statements         = try(each.value.topic_policy_statements, var.defaults.topic_policy_statements, {})
  create_subscription             = try(each.value.create_subscription, var.defaults.create_subscription, true)
  subscriptions                   = try(each.value.subscriptions, var.defaults.subscriptions, {})
  data_protection_policy          = try(each.value.data_protection_policy, var.defaults.data_protection_policy, null)
}
