module "wrapper" {
  source = "../../modules/subscription"

  for_each = var.items

  confirmation_timeout_in_minutes = try(each.value.confirmation_timeout_in_minutes, var.defaults.confirmation_timeout_in_minutes, 1)
  delivery_policy                 = try(each.value.delivery_policy, var.defaults.delivery_policy, null)
  endpoint                        = try(each.value.endpoint, var.defaults.endpoint)
  endpoint_auto_confirms          = try(each.value.endpoint_auto_confirms, var.defaults.endpoint_auto_confirms, false)
  filter_policy                   = try(each.value.filter_policy, var.defaults.filter_policy, null)
  filter_policy_scope             = try(each.value.filter_policy_scope, var.defaults.filter_policy_scope, "MessageAttributes")
  protocol                        = try(each.value.protocol, var.defaults.protocol, null)
  raw_message_delivery            = try(each.value.raw_message_delivery, var.defaults.raw_message_delivery, false)
  redrive_policy                  = try(each.value.redrive_policy, var.defaults.redrive_policy, null)
  subscription_role_arn           = try(each.value.subscription_role_arn, var.defaults.subscription_role_arn, null)
  topic_arn                       = try(each.value.topic_arn, var.defaults.topic_arn)
}
