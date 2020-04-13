resource "aws_subnet" "subnet1" {
  cidr_block = var.subnet1_cidr
  vpc_id = aws_vpc.vpc-tiendanube.id
  availability_zone = "us-east-1a" #hardcoded just for test purpose
}
resource "aws_subnet" "subnet2" {
  cidr_block = var.subnet2_cidr
  vpc_id = aws_vpc.vpc-tiendanube.id
  availability_zone = "us-east-1b" #hardcoded just for test purpose
}

resource "aws_route_table" "tiendanube-route-table" {
  vpc_id = aws_vpc.vpc-tiendanube.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tiendanube-gw.id
  }
  tags = {
    Name = "tiendanube-route-table"
  }
}
resource "aws_route_table_association" "subnet1-association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.tiendanube-route-table.id
}

resource "aws_route_table_association" "subnet2-association" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.tiendanube-route-table.id
}