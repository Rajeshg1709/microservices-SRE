terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      owner = "rajesh"
    }
  }
}

variable "region" {
  description = "aws region"
  default     = "us-east-2"
}