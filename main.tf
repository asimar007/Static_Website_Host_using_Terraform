# Create S3 Bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname
}

# Ownership Change
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Make it public
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# ACL
resource "aws_s3_bucket_acl" "example" {
  depends_on = [
  aws_s3_bucket_ownership_controls.example,
  aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}

# Enable Versioning
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.mybucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# upload the Object in the Bucket
resource "aws_s3_object" "index" {
  key        = "index.html"
  bucket     = aws_s3_bucket.mybucket.id
  source     = "/Users/asimar007/Downloads/Code/WEB/Protfolio/index.html"
  acl = "public-read"
  content_type = "text/html"
}
resource "aws_s3_object" "error" {
  key        = "error.html"
  bucket     = aws_s3_bucket.mybucket.id
  source     = "error.html"
  acl = "public-read"
  content_type = "text/html"
}
resource "aws_s3_object" "css" {
  key        = "styles.css"
  bucket     = aws_s3_bucket.mybucket.id
  source     = "/Users/asimar007/Downloads/Code/WEB/Protfolio/styles.css"
  acl = "public-read"
}
resource "aws_s3_object" "asim" {
  key        = "asim.png"
  bucket     = aws_s3_bucket.mybucket.id
  source     = "/Users/asimar007/Downloads/Code/WEB/Protfolio/images/asim.png"
  acl = "public-read"
}
resource "aws_s3_object" "logo" {
  key        = "logo.png"
  bucket     = aws_s3_bucket.mybucket.id
  source     = "/Users/asimar007/Downloads/Code/WEB/Protfolio/images/logo.png"
  acl = "public-read"
}
resource "aws_s3_object" "shape" {
  key        = "shape.png"
  bucket     = aws_s3_bucket.mybucket.id
  source     = "/Users/asimar007/Downloads/Code/WEB/Protfolio/images/shape.png"
  acl = "public-read"
}

# Website Configuration
resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
  depends_on = [ aws_s3_bucket_acl.example ]
}