provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket   = "ezy-terraform"
    key      = "terraform-state/pipeline1/terraform.tfstate"
    region   = "us-east-1"
  }
}
