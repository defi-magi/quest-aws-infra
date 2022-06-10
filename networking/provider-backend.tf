terraform {
  required_version = ">= 1.2.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.18.0"
    }
  }
}

provider "aws" {
  default_tags {
    tags = var.common_tags
  }
}

terraform {
  backend "s3" {
    bucket         = "quest-terraform-remote-state"
    key            = "quest-infra/quest-networking/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    kms_key_id     = "fd69cf79-218c-4a9e-8c56-90a25802ffa3"
    dynamodb_table = "tf-remote-state-lock"
  }
}

