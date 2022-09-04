terraform {
  cloud {
    organization = "personal-testing-terraform"

    workspaces {
      name = "terraform-github-actions"
    }
  }
}
provider "aws" {

}

resource "aws_s3_bucket" "b" {
  bucket = "My bucket-tanjil-september-2022"

  tags = {
    Name        = "My bucket-tanjil-september-2022"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}