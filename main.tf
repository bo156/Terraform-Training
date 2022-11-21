provider "aws" {
  region = "eu-west-1"
  profile = "dev2"
}

module "security_group" {
  source = "./resources/security_group"
}

module "iam" {
  source = "./resources/iam"
}

module "s3" {
  source = "./resources/s3"
}

output "s3_website" {
  value = module.s3.website_endpoint
}