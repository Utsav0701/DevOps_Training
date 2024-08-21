provider "aws" {
  region = var.region
}

# S3 Bucket
resource "aws_s3_bucket" "app_data" {
  bucket = var.bucket_name

  tags = {
    Name = join("-", ["s3-bucket", var.environment])
  }
}
