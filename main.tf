resource "aws_sns_topic" "this" {
  count = "${var.create_sns_topic && var.sns_topic_with_kms == 0 ? 1 : 0}"

  name = "${var.sns_topic_name}"

  policy          = "${var.policy}"
  delivery_policy = "${var.delivery_policy}"

  tags = "${var.tags}"
}

resource "aws_sns_topic" "this_with_kms" {
  count = "${var.create_sns_topic && var.sns_topic_with_kms == 1 ? 1 : 0}"

  name = "${var.sns_topic_name}"

  policy          = "${var.policy}"
  delivery_policy = "${var.delivery_policy}"

  kms_master_key_id = "${var.kms_master_key_id}"

  tags = "${var.tags}"
}
