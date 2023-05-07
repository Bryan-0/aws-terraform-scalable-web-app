resource "aws_iam_role" "ec2_s3_access_role" {
  name = "EC2S3WebAppFullAccessRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_instance_profile" "s3_access_profile" {
  name = "EC2S3WebAppProfileAccessRole"
  role = aws_iam_role.ec2_s3_access_role.name
}

resource "aws_iam_role_policy_attachment" "ec2_s3_policy_attachment" {
  role       = aws_iam_role.ec2_s3_access_role.id
  policy_arn = aws_iam_policy.s3_web_app_access_policy.arn
}
