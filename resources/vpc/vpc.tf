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
