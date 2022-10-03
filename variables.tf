# Input variable definitions

variable "infra_env" {
  type        = string
  description = "infrastructure environment"
  default     = "prod"
}

variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Size"
  default     = "t2.micro"
}

variable "bucket" {
  type        = string
  description = "Bucket name without env suffix"
}

# variable "AWS_SECRET_ACCESS_KEY" {
#   type        = string
#   description = "TEST"
#   default     = "t2.micro"
# }

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "example-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}

variable "aws_deployment_role" {
  description = "Role to assume for deployment"
  type        = string
  default     = "arn:aws:iam::018088791414:role/terraform"
}