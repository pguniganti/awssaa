output "log_group_name" {
  description = "The name of the CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.log_group.name
}

output "log_stream_name" {
  description = "The name of the CloudWatch Log Stream"
  value       = aws_cloudwatch_log_stream.log_stream.name
}
