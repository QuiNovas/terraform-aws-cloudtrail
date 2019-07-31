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

