resource "aws_s3_bucket_acl" "BarakS3Acl" {
  bucket = aws_s3_bucket.BarakS3.id
  acl = "public-read"
}

resource "aws_s3_bucket" "BarakS3" {
  bucket = "barak-training-bucket"
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.BarakS3.id
  key    = "index.html"
  source = "./resources/s3/index.html"
  acl = "public-read"
  content_type = "text/html"
}

output "website_endpoint" {
  value = aws_s3_bucket.BarakS3.website_endpoint
}
