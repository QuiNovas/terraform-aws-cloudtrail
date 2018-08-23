variable "account_name" {
  description = "The name of the account. Used as a prefix for naming resources"
  type        = "string"
}

variable "log_bucket" {
  description = "The log bucket to log S3 logs to."
  type        = "string"
}
