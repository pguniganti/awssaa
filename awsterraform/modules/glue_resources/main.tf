provider "aws" {
  region = var.region
}

resource "aws_glue_catalog_database" "priyank_database" {
  name = var.database_name
}

resource "aws_glue_crawler" "priyank_crawler" {
  name          = var.crawler_name
  role          = aws_iam_role.glue_role.arn
  database_name = aws_glue_catalog_database.priyank_database.name
  table_prefix  = "priyank_"
  s3_target {
    path = var.s3_path
  }
}

resource "aws_iam_role" "glue_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "glue.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "glue_policy" {
  role       = aws_iam_role.glue_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}
