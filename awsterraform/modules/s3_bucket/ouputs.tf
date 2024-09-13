output "bucket_ids" {
  value = [for i in aws_s3_bucket.s3_bucket : i.id]
}
