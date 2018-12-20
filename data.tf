resource "random_string" "unique_bucket_name" {
  length = 10
  special = false
  upper = false
}
