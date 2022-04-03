provider "aws" {
  region = "eu-west-1"
}

resource "aws_kms_key" "this" {}

module "users_unencrypted" {
  source = "../../"

  name = "users-unencrypted"

  tags = {
    Secure = "false"
  }
}

module "users_encrypted" {
  source = "../../"

  name_prefix       = "users-encrypted-"
  display_name      = "users-encrypted"
  kms_master_key_id = aws_kms_key.this.id

  tags = {
    Secure = "true"
  }
}

module "sqs_subscription" {
  source = "../../"

  name_prefix             = "users-encrypted-"
  display_name            = "users-encrypted"
  create_sqs_subscription = true
  sqs_endpoint_arn        = "arn:aws:sqs:us-east-1:123456789098:sqs-queue-name"
}
