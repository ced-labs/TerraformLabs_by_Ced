terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.64.0"
    }
  }
  required_version = "1.8.0"
}

provider "aws" {
  # eu-west-3 (Paris)
  region = "eu-west-3"

  default_tags {
    tags = var.main_tags
  }
}