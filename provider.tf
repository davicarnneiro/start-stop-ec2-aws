# Set a cloud provider
provider "aws" {
  region  = var.aws_region
  profile = "default" ## seu profile com as credenciais da aws
}

terraform {
  backend "s3" {
    bucket  = "SUA_BUCKET_S3"
    key     = "CAMINHO_PARA_GUARDAR_O_ARQUIVO/terraform.tfstate"
    region  = "SUA_REGIAO"
    profile = "default" ## seu profile com as credenciais da aws
  }
  required_providers {
    aws = ">= 2.53.0"
  }
}