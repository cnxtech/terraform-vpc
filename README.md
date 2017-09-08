# terraform-vpc

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws_region |  | string | `eu-west-1` | no |
| cidr_prefix |  | string | `172` | no |
| enable_dns_hostnames |  | string | `true` | no |
| enable_dns_support |  | string | `true` | no |
| subnet_cidr_blocks |  | map | `<map>` | no |
| subnet_count |  | string | `2` | no |
| tag_budget |  | string | - | yes |
| tag_project_identifier |  | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnet_ids | List of subnet identifiers |
| vpc_id | VPC resource identifier |
