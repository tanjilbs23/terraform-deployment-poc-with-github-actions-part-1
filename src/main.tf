terraform {
  cloud {
    organization = "personal-testing-terraform"

    workspaces {
      name = "terraform-poc-dev"
    }
  }
}
provider "aws" {
  # region  = var.region
  # profile = var.profile
}