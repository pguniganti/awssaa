variable "log_group_name" {
  description = "The name of the CloudWatch Log Group"
  type        = string
}

variable "log_stream_name" {
  description = "The name of the CloudWatch Log Stream"
  type        = string
}

variable "retention_in_days" {
  description = "The number of days to retain log events"
  type        = number
  default     = 7
}

variable "tags" {
  description = "Tags for the CloudWatch resources"
  type        = map(string)
}
