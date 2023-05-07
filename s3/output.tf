output "web_app_bucket_arn" {
  value = aws_s3_bucket.infra_files_bucket.arn
}

output "web_app_bucket_name" {
  value = aws_s3_bucket.infra_files_bucket.bucket
}
