locals {
  sqs_name = "my-queue"

  sns_name                 = "my-topic"
  sns_protocol             = "sqs"
  sns_raw_message_delivery = true
}
