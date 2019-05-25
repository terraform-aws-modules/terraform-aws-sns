resource "aws_sns_topic" "this" {
  count = "${var.create_sns_topic && var.sns_topic_with_kms == 0 ? 1 : 0}"

  name = "${var.sns_topic_name}"

  tags = "${var.tags}"
}


resource "aws_sns_topic" "this_with_kms" {
  count = "${var.create_sns_topic && var.sns_topic_with_kms == 1 ? 1 : 0}"

  name = "${var.sns_topic_name}"

  kms_master_key_id = "${var.kms_master_key_id}"

  tags = "${var.tags}"
}
