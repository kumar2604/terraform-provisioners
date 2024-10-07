terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  backend "s3" {
    bucket = "kumar-demo-24"
    key    = "provisioners"
    region = "us-east-1"
    dynamodb_table = "kumar-demo-table"
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}