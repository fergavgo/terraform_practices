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

resource "aws_internet_gateway" "public_GW" {
  vpc_id = aws_vpc.vpc_virginia.id

  tags = {
    Name = "Internet_GW_public_subnet_id"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_GW.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}


resource "aws_route_table_association" "RouteTableAssociation" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}



resource "aws_security_group" "Security_Group_publicInstance" {
  name        = "Public Instance SG"
  description = "Allow SSH inbound and All egress traffic"
  vpc_id      = aws_vpc.vpc_virginia.id

  ingress {
    description      = "Allow SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.SG_Ingress_CIDR]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSH IN ALL OUT"
  }
}