provider "aws" {
  region = "eu-west-1"
}

module "users_topic" {
  source = "../../"

  sns_topic_name = "users"

  tags = {
    Project    = "secret"
    Department = "kingdom"
  }
}

# This topic should not be created
module "users_topic_disabled" {
  source = "../../"

  sns_topic_name = "users"

  create = false

  tags = {
    Project    = "secret"
    Department = "kingdom"
  }
}
