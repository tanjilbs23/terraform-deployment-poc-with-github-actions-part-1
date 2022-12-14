terraform {
  cloud {
    organization = "personal-testing-terraform"

    workspaces {
      name = "sharebus-dev"
    }
  }
}
# AWS Provider
provider "aws" {}

data "aws_ssm_parameter" "bucket_name" {
  name = "/${var.environment}/bucket"
}

# module "s3_bucket" {
#   source = "terraform-aws-modules/s3-bucket/aws"

#   bucket                  = "tanjil_oct_23_20202"
#   block_public_acls       = true
#   block_public_policy     = true
#   restrict_public_buckets = true
#   ignore_public_acls      = true

#   website = {
#     index_document = "index.html"
#   }

#   server_side_encryption_configuration = {
#     rule = {
#       apply_server_side_encryption_by_default = {
#         sse_algorithm = "AES256"
#       }
#     }
#   }

#   tags = {
#     Name        = "sharebus-fe-${var.environment}"
#     Environment = var.environment
#     Project     = var.project
#   }

# }

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = data.aws_ssm_parameter.bucket_name.name
  acl    = "private"

  # versioning = {
  #   enabled = true
  # }

  tags = {
    Name        = "sharebus-fe-${var.environment}"
    Environment = var.environment
    Project     = var.project
  }

}