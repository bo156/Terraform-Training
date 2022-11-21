provider "aws" {
  region = "eu-west-1"
  profile = "dev2"
}
module "vpc" {
  source = "./resources/vpc"
}

module "security_group" {
  source = "./resources/security_group"
  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "./resources/iam"
}

module "s3" {
  source = "./resources/s3"
}

module "rds" {
  source = "./resources/rds"
  subnet_id = module.vpc.subnet_id
  az_subnet_id = module.vpc.az_subnet_id
}

module "ec2" {
  source = "./resources/ec2"
  subnet_id = module.vpc.subnet_id
  security_group = module.security_group.security_group_id
  barak_iam_profile_name = module.iam.barak_iam_profile_name
}

output "s3_website" {
  value = module.s3.website_endpoint
}