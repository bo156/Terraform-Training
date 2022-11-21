#variable "vpc_id" {
#  type = string
#  id = aws_vpc.BarakVPC.id
#}

resource "aws_vpc" "BarakVPC" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "BarakVPC"
  }
}

resource "aws_subnet" "BarakSubnet" {
  vpc_id = aws_vpc.BarakVPC.id
  cidr_block = "10.10.1.0/24"
  tags = {
    Name = "BarakSubnet"
  }
}

output "vpc_id" {
  value = aws_vpc.BarakVPC.id
}
