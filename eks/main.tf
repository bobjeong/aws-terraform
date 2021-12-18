provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Terraform   = "true"
      ClusterId = var.cluster_id
      Stage = var.stage_tag
    }
  }
}