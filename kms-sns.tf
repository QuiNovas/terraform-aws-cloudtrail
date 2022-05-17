data "aws_iam_policy_document" "sns" {
  statement {
    actions = [
      "kms:*",
    ]
    principals {
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      ]
      type = "AWS"
    }
    resources = [
      "*",
    ]
    sid = "Enable IAM User Permissions"
  }

  statement {
    actions = [
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
      "kms:Decrypt",
    ]
    principals {
      identifiers = [
        "cloudtrail.amazonaws.com",
      ]
      type = "Service"
    }
    resources = [
      "*",
    ]
    sid = "Allow CloudTrail to describe key"
  }
}

resource "aws_kms_key" "sns" {
  description         = "sns log key for ${local.trail_name}"
  enable_key_rotation = true
  policy              = data.aws_iam_policy_document.sns.json
}

resource "aws_kms_alias" "sns" {
  name          = "alias/${local.associated_resource_name}-sns"
  target_key_id = aws_kms_key.sns.key_id
}