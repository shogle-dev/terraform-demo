module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.21.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = var.vpc_tags
}

module "ec2_instances" {
  source        = "terraform-aws-modules/ec2-instance/aws"
  version       = "2.12.0"
  instance_type = var.instance_type

  name           = "my-ec2-cluster-${var.infra_env}"
  instance_count = 2

  ami                    = "ami-0c5204531f799e0c6"
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = "terraform-demo-20220920"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}