resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "deployment" {
  bucket = "blue-green-deployment-${random_id.bucket_suffix.hex}"

  tags = {
    Name    = "blue-green-deployment"
    Project = "aws-blue-green-deployment"
  }
}

resource "aws_s3_bucket_versioning" "deployment" {
  bucket = aws_s3_bucket.deployment.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "deployment" {
  bucket = aws_s3_bucket.deployment.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}