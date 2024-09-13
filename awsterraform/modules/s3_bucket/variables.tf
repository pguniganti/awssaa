variable "bucket_names" {
  description = "List of S3 bucket names"
  type        = list(string)

}

variable "tags" {
  description = "Tags for the S3 buckets"
  type        = map(string)
}
