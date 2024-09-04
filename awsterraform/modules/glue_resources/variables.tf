variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "database_name" {
  description = "The name of the Glue Catalog Database"
  type        = string
}

variable "crawler_name" {
  description = "The name of the Glue Crawler"
  type        = string
}

variable "s3_path" {
  description = "The S3 path for the Glue Crawler"
  type        = string
}

variable "role_name" {
  description = "The name of the IAM Role for Glue"
  type        = string
}
