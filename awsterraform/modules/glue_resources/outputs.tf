output "glue_catalog_database_name" {
  value = aws_glue_catalog_database.priyank_database.name
}

output "glue_crawler_name" {
  value = aws_glue_crawler.priyank_crawler.name
}
