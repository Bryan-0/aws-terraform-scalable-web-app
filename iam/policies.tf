resource "aws_iam_policy" "s3_web_app_access_policy" {
  name        = "s3_web_app_access_policy"
  description = "Gives full access to specific bucket."

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
        ]
        Effect   = "Allow"
        Resource = [var.web_app_bucket_arn, "${var.web_app_bucket_arn}/*"]
      }
    ]
  })
}
