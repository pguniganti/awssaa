variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

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

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
}

# Variables for EKS cluster
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "A list of CIDR blocks for the public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "A list of availability zones for the subnets"
  type        = list(string)
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "node_group_name" {
  description = "The name of the EKS node group"
  type        = string
}

variable "desired_size" {
  description = "The desired number of nodes in the node group"
  type        = number
}

variable "max_size" {
  description = "The maximum number of nodes in the node group"
  type        = number
}

variable "min_size" {
  description = "The minimum number of nodes in the node group"
  type        = number
}

variable "instance_types" {
  description = "A list of instance types for the node group"
  type        = list(string)
}
variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}
