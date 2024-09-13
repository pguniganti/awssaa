resource "aws_s3_bucket" "s3_bucket" {
  count  = length(var.bucket_names)
  bucket = var.bucket_names[count.index]

  tags = var.tags

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  count  = length(var.bucket_names)
  bucket = aws_s3_bucket.s3_bucket[count.index].id

  versioning_configuration {
    status = "Enabled"
  }
}

