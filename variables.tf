variable "account_name" {
  description = "The name of the account. Used as a prefix for naming resources"
  type        = string
}

variable "expiration" {
  default     = 2555
  description = "The number of days to wait before expiring an object"
  type        = number
}

variable "log_bucket" {
  description = "The log bucket to log S3 logs to."
  type        = string
}

variable "transition_to_glacier" {
  default     = 30
  description = "The number of days to wait before transitioning an object to Glacier"
  type        = number
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resources"
  type        = map(string)
  default     = {}
}