provider "aws" {
  region = "eu-west-1"
  profile = "dev2"
}

module "vpc" {
  source = "./resources/vpc"
}

