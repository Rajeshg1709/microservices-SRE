terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
        owner = "rajesh"
    }
  }
}