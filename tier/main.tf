provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Terraform   = "true"
      ClusterId   = var.cluster_name
    }
  }
}