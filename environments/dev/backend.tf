# Terraform configuration

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  cloud {
    organization = "sh-testing"

    workspaces {
      name = "terraform-git"
    }
  }
}