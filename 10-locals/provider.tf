terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.48.0"
    }
  }
  #remote state storage location
  backend "s3" {
    bucket         = "terraform-demo01-bucket"
    key            = "terraform-demo-remote-state.tfstate"
    region         = "us-east-1"
    encrypt        = true
    # Optional: enable native S3 locking (Terraform 1.10+)
    use_lockfile   = true
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}