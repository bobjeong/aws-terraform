terraform {
  # backend "s3" {
  #   region = "ap-northeast-2"
  #   bucket = ""
  #   key = ""
  # }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.63.0"
    }
  }

  required_version = "~> 1.0.0"
}