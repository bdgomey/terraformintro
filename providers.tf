terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.52.0"
    }
  }
  cloud {
    organization = "vettec"

    workspaces {
      name = "vettec"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = var.tags
  }
}


