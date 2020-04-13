resource "aws_security_group" "ec2-sg" {
  name = "ec2-sg"
  vpc_id = aws_vpc.vpc-tiendanube.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
    from_port = 22
    to_port = 22
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
  }
  // Terraform removes the default rule
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "-1"
    from_port = 0
    to_port = 0
  }
}

resource "aws_security_group" "lb-sg" {
  name = "lb-sg"
  vpc_id = aws_vpc.vpc-tiendanube.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
  }

  // Terraform removes the default rule
  egress {
    protocol  = "-1"
    from_port = 0
    to_port   = 0

    cidr_blocks = ["0.0.0.0/0"]
  }
}