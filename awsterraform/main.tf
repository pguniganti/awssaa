terraform {
  backend "s3" {
    bucket  = "priyank-test-v7"
    key     = "terraform/state"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}

module "s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = var.bucket_name
  tags        = var.tags
}
module "cloudwatch_logs" {
  source            = "./modules/cloudwatch_logs"
  log_group_name    = var.log_group_name
  log_stream_name   = var.log_stream_name
  retention_in_days = var.retention_in_days
  tags              = var.tags
}