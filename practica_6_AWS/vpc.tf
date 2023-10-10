resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  tags = {
    "Name" = "VPC_Virginia"
  }
}

resource "aws_subnet" "public_subnet" {
  tags = {
    "Name" = "Public_Subnet"
  }
  vpc_id                  = aws_vpc.vpc_virginia.id
  cidr_block              = var.Subredes[0]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  tags = {
    "Name" = "Private_Subnet"
  }
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.Subredes[1]
}