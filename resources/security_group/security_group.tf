variable "vpc_id" {
  type = string
}

variable "ports" {
  type = list(number)
  default = [80, 443]
}

resource "aws_security_group" "BarakSecurityGroup" {
  name = "BarakSecurityGroup"
  vpc_id = var.vpc_id

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

output "security_group_id" {
  value = aws_security_group.BarakSecurityGroup.id
}
