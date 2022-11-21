provider "aws" {
  region = "eu-west-1"
  profile = "dev2"
}

module "security_group" {
  source = "./resources/security_group"
}
