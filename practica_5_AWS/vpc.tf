resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  tags = {
    name = "vpc_virginia_east_1"
  }
}

resource "aws_vpc" "vpc_ohio" {
  cidr_block = var.ohio_cidr
  tags = {
    name = "vpc_ohio_1"
  }
  provider = aws.aws_ohio
}

output "NetworkAclOhio" {
  value = aws_vpc.vpc_ohio.default_network_acl_id
  description = "Network ACL Ohio"
}

output "NetworkAclVirginia" {
  value = aws_vpc.vpc_virginia.default_network_acl_id
  description = "Network ACL Virginia"
}

