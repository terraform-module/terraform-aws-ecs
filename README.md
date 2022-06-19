# WS Elastic Container Service (ECS) Terraform module

Terraform module which creates ECS resources on AWS.

This module focuses purely on ECS and nothing else. Therefore only these resources can be created with this module:

- [ECS](https://www.terraform.io/docs/providers/aws/r/ecs_cluster.html)
- [IAM](https://www.terraform.io/docs/providers/aws/r/iam_instance_profile.html)

However, having said the above to have a proper ECS cluster up and running multiple resources are needed. In most cases creating these resources is heavily opinionated and or context-bound. That is why this module does not create these resources. But you still need them to have a production ready environment. Therefore the example area shows how to create everything needed for a production environment.

Reasoining. Due to fact, that [base mobule](https://github.com/terraform-aws-modules/terraform-aws-ecs/tree/v3.5.0) was rewrited due, seems a bit clunky and it does solve some owner specific issue.

---

![](https://github.com/terraform-module/terraform-aws-ecs/workflows/release/badge.svg)
![](https://github.com/terraform-module/terraform-aws-ecs/workflows/commit-check/badge.svg)
![](https://github.com/terraform-module/terraform-aws-ecs/workflows/labeler/badge.svg)

[![](https://img.shields.io/github/license/terraform-module/terraform-aws-ecs)](https://github.com/terraform-module/terraform-aws-ecs)
![](https://img.shields.io/github/v/tag/terraform-module/terraform-aws-ecs)
![](https://img.shields.io/issues/github/terraform-module/terraform-aws-ecs)
![](https://img.shields.io/github/issues/terraform-module/terraform-aws-ecs)
![](https://img.shields.io/github/issues-closed/terraform-module/terraform-aws-ecs)
[![](https://img.shields.io/github/languages/code-size/terraform-module/terraform-aws-ecs)](https://github.com/terraform-module/terraform-aws-ecs)
[![](https://img.shields.io/github/repo-size/terraform-module/terraform-aws-ecs)](https://github.com/terraform-module/terraform-aws-ecs)
![](https://img.shields.io/github/languages/top/terraform-module/terraform-aws-ecs?color=green&logo=terraform&logoColor=blue)
![](https://img.shields.io/github/commit-activity/m/terraform-module/terraform-aws-ecs)
![](https://img.shields.io/github/contributors/terraform-module/terraform-aws-ecs)
![](https://img.shields.io/github/last-commit/terraform-module/terraform-aws-ecs)
[![Maintenance](https://img.shields.io/badge/Maintenu%3F-oui-green.svg)](https://GitHub.com/terraform-module/terraform-aws-ecs/graphs/commit-activity)
[![GitHub forks](https://img.shields.io/github/forks/terraform-module/terraform-aws-ecs.svg?style=social&label=Fork)](https://github.com/terraform-module/terraform-aws-ecs)

---

## Documentation

- [TFLint Rules](https://github.com/terraform-linters/tflint/tree/master/docs/rules)

## Usage example

IMPORTANT: The master branch is used in source just as an example. In your code, do not pin to master because there may be breaking changes between releases. Instead pin to the release tag (e.g. ?ref=tags/x.y.z) of one of our [latest releases](https://github.com/terraform-module/terraform-aws-ecs/releases).

```hcl
module "ecs" {
  source = "terraform-aws-modules/ecs/aws"

  name = "my-ecs"

  container_insights = true

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy = [
    {
      capacity_provider = "FARGATE_SPOT"
    }
  ]

  tags = {
    Environment = "Development"
  }
}
```

## Examples

See `examples` directory for working examples to reference

- [Complete ECS](https://github.com/terraform-module/terraform-aws-ecs/tree/master/examples/complete-ecs)

## Assumptions

## Available features

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity_providers"></a> [capacity\_providers](#input\_capacity\_providers) | List of short names of one or more capacity providers to associate with the cluster. Valid values also include FARGATE and FARGATE\_SPOT. | `list(string)` | `[]` | no |
| <a name="input_container_insights"></a> [container\_insights](#input\_container\_insights) | Controls if ECS Cluster has container insights enabled | `bool` | `false` | no |
| <a name="input_create_ecs"></a> [create\_ecs](#input\_create\_ecs) | Controls if ECS should be created | `bool` | `true` | no |
| <a name="input_default_capacity_provider_strategy"></a> [default\_capacity\_provider\_strategy](#input\_default\_capacity\_provider\_strategy) | The capacity provider strategy to use by default for the cluster. Can be one or more. | `list(map(any))` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to be used on all the resources as identifier, also the name of the ECS cluster | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to ECS Cluster | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecs_cluster_arn"></a> [ecs\_cluster\_arn](#output\_ecs\_cluster\_arn) | ARN of the ECS Cluster |
| <a name="output_ecs_cluster_id"></a> [ecs\_cluster\_id](#output\_ecs\_cluster\_id) | ID of the ECS Cluster |
| <a name="output_ecs_cluster_name"></a> [ecs\_cluster\_name](#output\_ecs\_cluster\_name) | The name of the ECS cluster |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


### :memo: Guidelines

 - :memo: Use a succinct title and description.
 - :bug: Bugs & feature requests can be be opened
 - :signal_strength: Support questions are better asked on [Stack Overflow](https://stackoverflow.com/)
 - :blush: Be nice, civil and polite ([as always](http://contributor-covenant.org/version/1/4/)).

## License

Copyright 2019 Ivan Katliarhcuk

MIT Licensed. See [LICENSE](./LICENSE) for full details.

## How to Contribute

Submit a pull request

# Authors

Currently maintained by [Ivan Katliarchuk](https://github.com/ivankatliarchuk) and these [awesome contributors](https://github.com/terraform-module/terraform-aws-ecs/graphs/contributors).

[![ForTheBadge uses-git](http://ForTheBadge.com/images/badges/uses-git.svg)](https://GitHub.com/)

## Terraform Registry

- [Module](https://registry.terraform.io/modules/terraform-module/ecs/aws)

## Resources

- [Terraform modules](https://registry.terraform.io/namespaces/terraform-module)

## Clone Me

[**Create a repository using this template →**][template.generate]

<!-- resources -->
[template.generate]: https://github.com/terraform-module/terraform-aws-ecs/generate
