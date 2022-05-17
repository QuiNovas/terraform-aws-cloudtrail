output "cloudtrail_arn" {
  description = "The Amazon Resource Name of the trail."
  value       = aws_cloudtrail.cloudtrail.arn
}

output "cloudtrail_id" {
  description = "The name of the trail."
  value       = aws_cloudtrail.cloudtrail.id
}

output "cloudtrail_cloudwatch_log_group_name" {
  description = "value"
  value       = aws_cloudwatch_log_group.cloudtrail.name
}

output "cloudtrail_cloudwatch_log_group_arn" {
  description = "value"
  value       = aws_cloudwatch_log_group.cloudtrail.arn
}

output "cloudtrail_cmk_alias" {
  description = "CloudTrail KMS Key Alias"
  value       = aws_kms_alias.cloudtrail.name
}

output "cloudtrail_cmk_id" {
  description = "CloudTrail KMS Key ID"
  value       = aws_kms_key.cloudtrail.id
}

output "s3_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = aws_s3_bucket.cloudtrail.arn
}

output "s3_bucket_id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.cloudtrail.id
}

output "sns_arn" {
  description = "The ARN of the SNS topic,"
  value       = aws_sns_topic.cloudtrail.arn
}

