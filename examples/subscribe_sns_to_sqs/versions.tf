terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.37"
    }
  }

  required_version = ">= 0.12"
}
