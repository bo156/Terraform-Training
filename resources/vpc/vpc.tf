resource "aws_vpc" "BarakVPC" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "BarakVPC"
  }
}

resource "aws_subnet" "BarakSubnet" {
  vpc_id = aws_vpc.BarakVPC.id
  cidr_block = "10.10.1.0/24"
  availability_zone = "eu-west-1b"
  tags = {
    Name = "BarakSubnet"
  }
}

resource "aws_subnet" "BarakAZSubnet" {
  vpc_id = aws_vpc.BarakVPC.id
  cidr_block = "10.10.2.0/24"
  availability_zone = "eu-west-1c"
}

output "subnet_id" {
  value = aws_subnet.BarakSubnet.id
}

output "az_subnet_id" {
  value = aws_subnet.BarakAZSubnet.id
}

output "vpc_id" {
  value = aws_vpc.BarakVPC.id
}
