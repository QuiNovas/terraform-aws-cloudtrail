# terraform-aws-cloudtrail

This module sets up CloudTrail for an AWS account, including writing to CloudWatch, an S3 bucket and an SNS topic.

 ## Example Usage:
```
module "cloudtrail" {
  source = "StratusGrid/cloudtrail/aws"
  version = "2.1.0"
  name_prefix = var.name_prefix
  log_bucket  = module.s3_bucket_logging.bucket_id
  input_tags  = merge(local.common_tags, {})
}
```

## Authors

Module originally forked from Quinovas (https://github.com/QuiNovas)

## License

Apache License, Version 2.0, January 2004 (http://www.apache.org/licenses/). See LICENSE for full details.
