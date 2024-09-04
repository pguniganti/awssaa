provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket  = "priyank-test-v7"
    key     = "terraform/state"
    region  = "us-east-1"
    encrypt = true
  }
}

module "cloudwatch_logs" {
  source            = "./modules/cloudwatch_logs"
  log_group_name    = var.log_group_name
  log_stream_name   = var.log_stream_name
  retention_in_days = var.retention_in_days
  tags              = var.tags
}

module "glue_resources" {
  source        = "./modules/glue_resources"
  region        = var.region
  database_name = var.database_name
  crawler_name  = var.crawler_name
  s3_path       = var.s3_path
  role_name     = var.role_name
}
