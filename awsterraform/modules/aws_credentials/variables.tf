variable "region" {
  description = "The AWS region where secrets manager is located"
  type        = string
  default     = "us-east-1"
}

variable "secret_name" {
  description = "The name of the secret"
  type        = string
}

variable "secret_description" {
  description = "The description of the secret"
  type        = string
  default     = "Managed by Terraform"
}

variable "aws_access_key_id" {
  description = "The AWS access key ID"
  type        = string
}

variable "aws_secret_access_key" {
  description = "The AWS secret access key"
  type        = string
}
