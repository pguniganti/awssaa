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

