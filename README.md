AWS SNS Topic Terraform module
=================================

Terraform module which creates SNS resources on AWS

This type of resources are supported:

* [SNS topic] (https://www.terraform.io/docs/providers/aws/r/sns_topic.html) 

Usage
-----

```hcl
module "sns_topic" {
  source = "terraform-aws-modules/sns/aws"
  name  = "my-topic"
}
```
Authors
-------

Module managed by [Anton Babenko](https://github.com/antonbabenko).

License
-------

Apache 2 Licensed. See LICENSE for full details.
