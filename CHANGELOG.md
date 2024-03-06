# Changelog

All notable changes to this project will be documented in this file.

## [6.0.1](https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v6.0.0...v6.0.1) (2024-03-06)


### Bug Fixes

* Update CI workflow versions to remove deprecated runtime warnings ([#51](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/51)) ([367df2e](https://github.com/terraform-aws-modules/terraform-aws-sns/commit/367df2e89d649c09170958bcdd31f8573550a5e6))

## [6.0.0](https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v5.4.0...v6.0.0) (2023-11-13)


### ⚠ BREAKING CHANGES

* Add `archive_policy` and `replay_policy` configurations and v5 upgrade (#50)

### Features

* Add `archive_policy` and `replay_policy` configurations and v5 upgrade ([#50](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/50)) ([30e89b9](https://github.com/terraform-aws-modules/terraform-aws-sns/commit/30e89b92b6c7e34e4ace30cf2eeeeab2be119cc1))

## [5.4.0](https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v5.3.0...v5.4.0) (2023-08-28)


### Features

* Remove deprecated policy action  ([#47](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/47)) ([7320f20](https://github.com/terraform-aws-modules/terraform-aws-sns/commit/7320f20294e400322a892e7d71c144458b3416d7))

## [5.3.0](https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v5.2.0...v5.3.0) (2023-04-10)


### Features

* Add support for tracing_config ([#44](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/44)) ([76a3b48](https://github.com/terraform-aws-modules/terraform-aws-sns/commit/76a3b481e6f7376a6af7df7f02e552d9b5683b38))

## [5.2.0](https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v5.1.0...v5.2.0) (2023-04-08)


### Features

* Add data protection policy support ([#43](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/43)) ([a4d89d3](https://github.com/terraform-aws-modules/terraform-aws-sns/commit/a4d89d3281b3d9bcc70e731e652944501fe4dc8d))

## [5.1.0](https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v5.0.1...v5.1.0) (2023-02-25)


### Features

* Add support for signature version ([#42](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/42)) ([b7d59e3](https://github.com/terraform-aws-modules/terraform-aws-sns/commit/b7d59e3d0c46232fb956e7ba7a6be1c200dee966))

### [5.0.1](https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v5.0.0...v5.0.1) (2023-02-22)


### Bug Fixes

* Attach external topic policy when `create_topic_policy` is `false` ([#41](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/41)) ([bc40f51](https://github.com/terraform-aws-modules/terraform-aws-sns/commit/bc40f510681a8e04362d4a41e552b72cd9a913d0))

## [5.0.0](https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v4.1.0...v5.0.0) (2023-01-03)


### ⚠ BREAKING CHANGES

* Add support for SNS topic filtering, subscriptions, and topic policy creation (#36)

### Features

* Add support for SNS topic filtering, subscriptions, and topic policy creation ([#36](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/36)) ([707b407](https://github.com/terraform-aws-modules/terraform-aws-sns/commit/707b407f0cfb37aee2dc99f9a2e693c5845d503a))


### Bug Fixes

* Use a version for  to avoid GitHub API rate limiting on CI workflows ([#39](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/39)) ([117400e](https://github.com/terraform-aws-modules/terraform-aws-sns/commit/117400e7d35562a6e911e77eb2e6eb05e32ac5a0))

## [4.1.0](https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v4.0.0...v4.1.0) (2022-12-04)


### Features

* Add firehose args ([#35](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/35)) ([eb5b965](https://github.com/terraform-aws-modules/terraform-aws-sns/commit/eb5b96574e9bd0bd6454dedb6e90eeaf3b694fe7))

## [4.0.0](https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v3.3.0...v4.0.0) (2022-10-27)


### ⚠ BREAKING CHANGES

* Update supported Terraform min version to v1.0+ and AWS provider to v4.0+ (#33)

### Features

* Update supported Terraform min version to v1.0+ and AWS provider to v4.0+ ([#33](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/33)) ([fb6db3e](https://github.com/terraform-aws-modules/terraform-aws-sns/commit/fb6db3e0cce10604d732ff269aa6f50e1d240066))

# [3.3.0](https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v3.2.0...v3.3.0) (2021-12-16)


### Bug Fixes

* update CI/CD process to enable auto-release workflow ([#26](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/26)) ([97a7100](https://github.com/terraform-aws-modules/terraform-aws-sns/commit/97a7100685e29a8901365ebff79efeac7225bf36))


### Features

* Added outputs sns_topic_name, sns_topic_id, sns_topic_owner ([#27](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/27)) ([e502a5f](https://github.com/terraform-aws-modules/terraform-aws-sns/commit/e502a5f2d71a490d41927fd5c1a84037163388f7))

<a name="v3.2.0"></a>
## [v3.2.0] - 2021-09-15

- feat: Added content-based deduplication ([#25](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/25))


<a name="v3.1.0"></a>
## [v3.1.0] - 2021-06-03

- feat: Add support for FIFO topic ([#24](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/24))
- chore: update CI/CD to use stable `terraform-docs` release artifact and discoverable Apache2.0 license ([#22](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/22))


<a name="v3.0.0"></a>
## [v3.0.0] - 2021-04-27

- feat: Shorten outputs (removing this_) ([#21](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/21))
- chore: update documentation and pin `terraform_docs` version to avoid future changes ([#20](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/20))


<a name="v2.3.0"></a>
## [v2.3.0] - 2021-03-15

- fix: update min terrafom version to allow static checks to pass ([#19](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/19))


<a name="v2.2.0"></a>
## [v2.2.0] - 2021-03-14

- chore: add ci-cd workflow for pre-commit checks ([#18](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/18))


<a name="v2.1.0"></a>
## [v2.1.0] - 2019-11-12

- Updated pre-commit


<a name="v2.0.0"></a>
## [v2.0.0] - 2019-06-12

- Upgraded module to support Terraform 0.12 ([#4](https://github.com/terraform-aws-modules/terraform-aws-sns/issues/4))
- Fix markdown link format


<a name="v1.1.0"></a>
## [v1.1.0] - 2018-05-16

- Added pre-commit hook to autogenerate terraform-docs


<a name="v1.0.0"></a>
## [v1.0.0] - 2018-03-12

- Fixed and release
- Fix: checkout vars.tf
- Feat: add license file and fix minor issue
- Fix: resolve review comments
- Feat: update README file
- Feat: basic sns topic setup


<a name="v0.0.2"></a>
## [v0.0.2] - 2017-09-26



<a name="v0.0.1"></a>
## v0.0.1 - 2017-09-26

- Initial commit
- Initial commit


[Unreleased]: https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v3.2.0...HEAD
[v3.2.0]: https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v3.1.0...v3.2.0
[v3.1.0]: https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v3.0.0...v3.1.0
[v3.0.0]: https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v2.3.0...v3.0.0
[v2.3.0]: https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v2.2.0...v2.3.0
[v2.2.0]: https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v2.1.0...v2.2.0
[v2.1.0]: https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v2.0.0...v2.1.0
[v2.0.0]: https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v1.1.0...v2.0.0
[v1.1.0]: https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v1.0.0...v1.1.0
[v1.0.0]: https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v0.0.2...v1.0.0
[v0.0.2]: https://github.com/terraform-aws-modules/terraform-aws-sns/compare/v0.0.1...v0.0.2
