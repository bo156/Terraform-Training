variable "subnet_id" {
  type = string
}

variable "security_group" {
  type = string
}

variable "barak_iam_profile_name" {
  type = string
}

resource "aws_instance" "BarakEC2" {
  ami = "ami-01cae1550c0adea9c"
  instance_type = "t2.micro"

  tags = {
      Name = "BarakEC2"
  }

  iam_instance_profile = var.barak_iam_profile_name
  subnet_id = var.subnet_id
  security_groups = [var.security_group]
}
