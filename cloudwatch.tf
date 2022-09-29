data "aws_iam_policy_document" "cloudwatch_assume_role" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      identifiers = [
        "cloudtrail.amazonaws.com",
      ]
      type = "Service"
    }
  }
}

resource "aws_iam_role" "cloudwatch_logs" {
  assume_role_policy = data.aws_iam_policy_document.cloudwatch_assume_role.json
  name               = local.associated_resource_name
}

#tfsec:ignore:aws-cloudwatch-log-group-customer-key -- Ignores warning on Log group not encrypted
resource "aws_cloudwatch_log_group" "cloudtrail" {
  name              = local.associated_resource_name
  retention_in_days = 7
}

#tfsec:ignore:aws-iam-no-policy-wildcards
data "aws_iam_policy_document" "cloudwatch_logs_role" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    resources = [
      "${aws_cloudwatch_log_group.cloudtrail.arn}:*",
    ]
    sid = "AWSCloudTrailLogging"
  }
}

resource "aws_iam_role_policy" "cloudwatch_logs" {
  name   = "cloudwatch-logs"
  policy = data.aws_iam_policy_document.cloudwatch_logs_role.json
  role   = aws_iam_role.cloudwatch_logs.id
}