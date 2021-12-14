provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Terraform   = "true"
      ClusterId = var.cluster_id
      Department  = var.default_tag
      Stage = var.stage_tag
    }
  }
}