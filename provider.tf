# Set a cloud provider
provider "aws" {
  region  = var.aws_region
  profile = "default"
}

terraform {
  backend "s3" {
    bucket  = "terraform-backend-iaas-tfstate"
    key     = "aws/us-west-2/module-computer/lambda/terraform.tfstate"
    region  = "us-west-2"
    profile = "default"
  }
  required_providers {
    aws = ">= 2.53.0"
  }
}