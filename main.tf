provider "aws" {
  region                      = "eu-central-1"
  access_key                  = "test123"
  secret_key                  = "testabc"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_force_path_style         = true
  endpoints {
    s3 = "http://localhost:4566"
  }
}

# Create Bucket
resource "aws_s3_bucket" "b" {
  bucket = "test-bucket-terraform"
  acl    = "public-read"
}

# Upload an object
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.b.id
  key    = "test.txt"
  acl    = "public-read"
  source = "test.txt"
}