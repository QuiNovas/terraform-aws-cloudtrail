locals {
  associated_resource_name  = "${var.name_prefix}-cloudtrail${var.name_suffix}"
  trail_name                = "${var.name_prefix}-trail${var.name_suffix}"
}
