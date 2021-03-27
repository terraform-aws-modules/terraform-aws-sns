# Complete SNS topic example

Configuration in this directory creates SNS topics.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.64 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.64 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_users_encrypted"></a> [users\_encrypted](#module\_users\_encrypted) | ../../ |  |
| <a name="module_users_unencrypted"></a> [users\_unencrypted](#module\_users\_unencrypted) | ../../ |  |

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_users_encrypted_this_sns_topic_arn"></a> [users\_encrypted\_this\_sns\_topic\_arn](#output\_users\_encrypted\_this\_sns\_topic\_arn) | The ARN of the SNS topic |
| <a name="output_users_unencrypted_this_sns_topic_arn"></a> [users\_unencrypted\_this\_sns\_topic\_arn](#output\_users\_unencrypted\_this\_sns\_topic\_arn) | The ARN of the SNS topic |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
