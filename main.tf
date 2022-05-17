resource "aws_cloudtrail" "cloudtrail" {
  cloud_watch_logs_group_arn    = "${aws_cloudwatch_log_group.cloudtrail.arn}:*"
  cloud_watch_logs_role_arn     = aws_iam_role.cloudwatch_logs.arn
  depends_on                    = [aws_s3_bucket_policy.cloudtrail]
  enable_log_file_validation    = true
  include_global_service_events = true
  is_multi_region_trail         = true
  kms_key_id                    = aws_kms_key.cloudtrail.arn
  name                          = local.trail_name
  s3_bucket_name                = aws_s3_bucket.cloudtrail.id
  sns_topic_name                = aws_sns_topic.cloudtrail.name

  dynamic "event_selector" {
    for_each = var.event_selectors
    content {
      include_management_events = event_selector.value["include_management_events"]
      read_write_type           = event_selector.value["read_write_type"]

      data_resource {
        type   = event_selector.value["data_resource_type"]
        values = event_selector.value["data_resource_values"]
      }
    }
  }

  tags = merge(
    local.common_tags,
    {
      "Name" = local.trail_name
    },
  )
}

