variable "name_prefix" {
  description = "String to prefix on object names"
  type        = string
}

variable "name_suffix" {
  description = "String to append to object names. This is optional, so start with dash if using"
  type        = string
  default     = ""
}

variable "input_tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "expiration" {
  default     = 2557
  description = "The number of days to wait before expiring an object"
  type        = number
}

variable "log_bucket" {
  description = "The log bucket to log S3 logs to."
  type        = string
}

variable "transition_to_glacier" {
  default     = 366
  description = "The number of days to wait before transitioning an object to Glacier"
  type        = number
}

# Enabling this setting is difficult and involves initally having it false to create the bucket
# (making sure to have lifecycle rules disabled as that prevent enabling mfa delete),
# signing into the aws console using the root account, creating a root access key, using that
# root access to enable mfa delete on the bucket using the cli, and then setting this value
# to true in order for terraform to avoid attempting (and failing) to modify the setting
# https://docs.aws.amazon.com/AmazonS3/latest/userguide/MultiFactorAuthenticationDelete.html
# https://docs.aws.amazon.com/general/latest/gr/root-vs-iam.html#aws_tasks-that-require-root
variable "enable_mfa_delete_cloudtrail_bucket" {
  default     = false
  description = "Enable/Disable MFA Required for Object Deletion for Cloudtrail Bucket"
  type        = bool
}

variable "event_selectors" {
  default     = []
  description = "Selector for cloudtrail data event collection"
  type = list(object({
    include_management_events = bool
    read_write_type           = string
    data_resource_type        = string
    data_resource_values      = list(string)
  }))
}
