resource "aws_vpc" "vpc-tiendanube" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags =  {
    Name = "vpc-tiendanube"
  }
}

resource "aws_eip" "ip-tiendanube-apache" {
  instance = aws_instance.tiendanube-apache.id
  vpc      = true
}

resource "aws_eip" "ip-tiendanube-nginx" {
  instance = aws_instance.tiendanube-nginx.id
  vpc      = true
}

resource "aws_internet_gateway" "tiendanube-gw" {
  vpc_id = aws_vpc.vpc-tiendanube.id
  tags = {
    Name = "tiendanube-gw"
  }
}