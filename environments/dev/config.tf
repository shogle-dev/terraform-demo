provider "aws" {
  region = var.region
  assume_role {
    duration     = "1h"
    session_name = "terraform-deploy"
    role_arn     = var.aws_deployment_role
    external_id  = "terraform-access-001"
  }
}