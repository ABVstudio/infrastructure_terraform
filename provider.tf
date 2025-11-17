terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.15.0"
    }
  }
  backend "s3" {
    bucket                  = "lepseyname-bucket"
    key                     = "123456-1"
    region                  = var.region
    shared_credentials_file = "~/.aws/credentials"
  }
}
provider "aws" {
  region = var.region
  shared_credentials_files = ["~/.aws/credentials"]
}
