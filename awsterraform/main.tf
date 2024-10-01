provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket  = "priyank-test-v7"
    key     = "terraform/state"
    region  = "us-east-1"
    encrypt = true
  }
}

resource "aws_instance" "nat_instance" {
  ami           = "ami-0ebfd941bbafe70c6" # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "NAT Instance"
  }
}

module "cloudwatch_logs" {
  source            = "./modules/cloudwatch_logs"
  log_group_name    = var.log_group_name
  log_stream_name   = var.log_stream_name
  retention_in_days = var.retention_in_days
  tags              = var.tags
}

module "glue_resources" {
  source        = "./modules/glue_resources"
  region        = var.region
  database_name = var.database_name
  crawler_name  = var.crawler_name
  s3_path       = var.s3_path
  role_name     = var.role_name
}

module "eks_cluster" {
  source = "./modules/eks_cluster_module"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
  cluster_name        = var.cluster_name
  node_group_name     = var.node_group_name
  desired_size        = var.desired_size
  max_size            = var.max_size
  min_size            = var.min_size
  instance_types      = var.instance_types
  public_subnet_id    = var.public_subnet_id

  depends_on = [aws_instance.nat_instance]
}

provider "kubernetes" {
  host                   = module.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(module.eks_cluster.certificate_authority)
  token                  = data.aws_eks_cluster_auth.eks.token
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks_cluster.cluster_name
}
