terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.61.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
  }
  backend "s3" {
    bucket  = "microservices-tf-state"
    encrypt = true
    key     = "MICROSERVICES-SRE/microservices/terraform/Monitoring/terraform.tfstate"
    region  = "us-east-2"
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      owner = "tfadmin"
    }
  }
}
provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks_cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_autority[0].data)
    token                  = data.aws_eks_cluster_auth.eks_cluster_auth.token
  }
}

variable "region" {
  description = "aws region"
  default     = "us-east-2"
}

data "aws_eks_cluster" "eks_cluster" {
  name = local.cluster_name
}

data "aws_eks_cluster_auth" "eks_cluster_auth" {
  name = local.cluster_name
}