variable "access_key" {}

variable "secret_key" {}

variable "aws_region" {
  default = "us-east-1"
}

variable server_name {
  default = "tiendanube"
}

variable instance_type {
  default = "t2.micro"
}

variable ssh_key_name {
  default = "tiendanube"
}

variable ami {
  default = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
}

variable "vpc_cidr" {
  default = "10.66.0.0/16"
}

variable "subnet1_cidr" {
  default = "10.66.1.0/24"
}

variable "subnet2_cidr" {
  default = "10.66.2.0/24"
}
