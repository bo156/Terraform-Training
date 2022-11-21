module "vpc" {
  source = "../vpc"
}

variable "ports" {
  type = list(number)
  default = [80, 443]
}

resource "aws_security_group" "BarakSecurityGroup" {
  name = "BarakSecurityGroup"
  vpc_id = module.vpc.vpc_id

  dynamic "ingress" {
    iterator = port
    for_each = var.ports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.ports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
