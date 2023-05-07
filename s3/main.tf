resource "aws_s3_bucket" "infra_files_bucket" {
  bucket = var.bucket_name == "None" ? "webappbucket-${random_uuid.bucket_uuid.result}" : var.bucket_name

  tags = {
    Name = "WebAppBucket"
  }
}

resource "random_uuid" "bucket_uuid" {
}
