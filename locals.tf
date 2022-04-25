locals {
  associated_resource_name = "${var.name_prefix}-cloudtrail${var.name_suffix}"
  trail_name               = "${var.name_prefix}-trail${var.name_suffix}"

  common_tags = merge(var.input_tags, {
    "ModuleSourceRepo" = "github.com/StratusGrid/terraform-aws-cloudtrail"
  })
}

