


resource "aws_vpc" "vpc_virginia" {
  cidr_block = "10.10.0.0/23"
  tags = {
    name = "vpc_virginia_east_1"
  }
}

resource "aws_vpc" "vpc_ohio" {
  cidr_block = "10.10.4.0/23"
  tags = {
    name = "vpc_ohio_1"
  }
  provider = aws.aws_ohio
}





