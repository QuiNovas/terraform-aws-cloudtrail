<!-- BEGIN_TF_DOCS -->
# terraform-aws-cloudtrail

GitHub: [StratusGrid/terraform-aws-cloudtrail](https://github.com/StratusGrid/terraform-aws-cloudtrail)

This module sets up CloudTrail for an AWS account, including writing to CloudWatch, an S3 bucket and an SNS topic.

# Examples

```hcl
module "cloudtrail" {
  source = "StratusGrid/cloudtrail/aws"
  # StratusGrid recommends pinning every module to a specific version
  version = "x.x.x"

  name_prefix = var.name_prefix
  log_bucket  = module.s3_bucket_logging.bucket_id

  input_tags  = merge(local.common_tags, {})
}
```

---

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudtrail.cloudtrail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail) | resource |
| [aws_cloudwatch_log_group.cloudtrail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_role.cloudwatch_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.cloudwatch_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_kms_alias.cloudtrail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_alias.sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.cloudtrail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key.sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.cloudtrail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.cloudtrail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_lifecycle_configuration.cloudtrail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_logging.cloudtrail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_policy.cloudtrail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_versioning.resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_sns_topic.cloudtrail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.cloudtrail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_mfa_delete_cloudtrail_bucket"></a> [enable\_mfa\_delete\_cloudtrail\_bucket](#input\_enable\_mfa\_delete\_cloudtrail\_bucket) | Enable/Disable MFA Required for Object Deletion for Cloudtrail Bucket | `bool` | `false` | no |
| <a name="input_event_selectors"></a> [event\_selectors](#input\_event\_selectors) | Selector for cloudtrail data event collection | <pre>list(object({<br>    include_management_events = bool<br>    read_write_type           = string<br>    data_resource_type        = string<br>    data_resource_values      = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_expiration"></a> [expiration](#input\_expiration) | The number of days to wait before expiring an object | `number` | `2557` | no |
| <a name="input_input_tags"></a> [input\_tags](#input\_input\_tags) | Map of tags to apply to resources | `map(string)` | `{}` | no |
| <a name="input_log_bucket"></a> [log\_bucket](#input\_log\_bucket) | The log bucket to log S3 logs to. | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | String to prefix on object names | `string` | n/a | yes |
| <a name="input_name_suffix"></a> [name\_suffix](#input\_name\_suffix) | String to append to object names. This is optional, so start with dash if using | `string` | `""` | no |
| <a name="input_transition_to_glacier"></a> [transition\_to\_glacier](#input\_transition\_to\_glacier) | The number of days to wait before transitioning an object to Glacier | `number` | `366` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudtrail_arn"></a> [cloudtrail\_arn](#output\_cloudtrail\_arn) | The Amazon Resource Name of the trail. |
| <a name="output_cloudtrail_cloudwatch_log_group_arn"></a> [cloudtrail\_cloudwatch\_log\_group\_arn](#output\_cloudtrail\_cloudwatch\_log\_group\_arn) | value |
| <a name="output_cloudtrail_cloudwatch_log_group_name"></a> [cloudtrail\_cloudwatch\_log\_group\_name](#output\_cloudtrail\_cloudwatch\_log\_group\_name) | value |
| <a name="output_cloudtrail_cmk_alias"></a> [cloudtrail\_cmk\_alias](#output\_cloudtrail\_cmk\_alias) | CloudTrail KMS Key Alias |
| <a name="output_cloudtrail_cmk_id"></a> [cloudtrail\_cmk\_id](#output\_cloudtrail\_cmk\_id) | CloudTrail KMS Key ID |
| <a name="output_cloudtrail_id"></a> [cloudtrail\_id](#output\_cloudtrail\_id) | The name of the trail. |
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | The name of the bucket. |
| <a name="output_sns_arn"></a> [sns\_arn](#output\_sns\_arn) | The ARN of the SNS topic, |

---

## Contributors
- Wesley Kirkland [wesleykirklandsg](https://github.com/wesleykirklandsg)
- Module originally forked from [Quinovas](https://github.com/QuiNovas)

<span style="color:red">Note:</span> Manual changes to the README will be overwritten when the documentation is updated. To update the documentation, run `terraform-docs -c .config/.terraform-docs.yml .`
<!-- END_TF_DOCS -->