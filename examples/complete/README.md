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
| terraform | >= 0.12.6 |
| aws | >= 2.64 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.64 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| users_encrypted | ../../ |  |
| users_unencrypted | ../../ |  |

## Resources

| Name |
|------|
| [aws_kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) |

## Inputs

No input.

## Outputs

| Name | Description |
|------|-------------|
| users\_encrypted\_this\_sns\_topic\_arn | The ARN of the SNS topic |
| users\_unencrypted\_this\_sns\_topic\_arn | The ARN of the SNS topic |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
