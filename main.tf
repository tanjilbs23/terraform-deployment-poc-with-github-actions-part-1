provider "aws" {}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket                  = "oct-26-2022-tanjil"
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true

  website = {
    index_document = "index.html"
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "oct-26-2022-tanjil"
    Environment = var.environment
  }

}