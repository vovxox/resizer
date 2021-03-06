# S3 Bucket and Object. This is where the application is located.
resource "aws_s3_bucket" "lambda" {
  bucket = var.bucket_name
  acl    = "private"

  force_destroy = true
  cors_rule {
    allowed_headers = ["Authorization"]
    allowed_methods = ["POST", "GET"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_object" "lambda" {
  bucket = aws_s3_bucket.lambda.id
  key    = "${var.app_version}-deploy.zip"
  source = "../deploy.zip"
}
