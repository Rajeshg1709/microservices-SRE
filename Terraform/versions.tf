terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.61.0"
    }
  }
  backend "s3" {
    bucket  = "microservices-tf-state"
    encrypt = true
    key     = "MICROSERVICES-SRE/microservices/terraform/terraform.tfstate"
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

variable "region" {
  description = "aws region"
  default     = "us-east-2"
}