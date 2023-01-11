provider "aws" {
  region  = "us-east-1"
  profile = "jeff_personal"
}

# terraform {
#   backend "s3" {
#     bucket   = "gralsin-terraform"
#     key      = "terraform-state/vpc/terraform.tfstate"
#     region   = "us-east-1"
#     // role_arn = "arn:aws:iam::261004987606:role/rivendel-servicos"
#   }
# }
