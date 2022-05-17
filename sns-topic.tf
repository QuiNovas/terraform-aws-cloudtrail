resource "aws_sns_topic" "cloudtrail" {
  name              = local.associated_resource_name
  kms_master_key_id = aws_kms_key.sns.id
}

data "aws_iam_policy_document" "cloudtrail_sns" {
  statement {
    actions = [
      "sns:Publish",
    ]
    principals {
      identifiers = [
        "cloudtrail.amazonaws.com",
      ]
      type = "Service"
    }
    resources = [
      aws_sns_topic.cloudtrail.arn,
    ]
    sid = "CloudTrail SNS Policy"
  }
  statement {
    actions = [
      "sns:Publish",
    ]
    condition {
      test = "Bool"
      values = [
        "false",
      ]
      variable = "aws:SecureTransport"
    }
    effect = "Deny"
    principals {
      identifiers = [
        "*",
      ]
      type = "AWS"
    }
    resources = [
      aws_sns_topic.cloudtrail.arn,
    ]
    sid = "DenyUnsecuredTransport"
  }
}

resource "aws_sns_topic_policy" "cloudtrail" {
  arn    = aws_sns_topic.cloudtrail.arn
  policy = data.aws_iam_policy_document.cloudtrail_sns.json
}

