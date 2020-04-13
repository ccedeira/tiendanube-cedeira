resource "aws_instance" "tiendanube-apache" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.ssh_key_name
  security_groups = [
    aws_security_group.ec2-sg.id]
  subnet_id = aws_subnet.subnet1.id
  user_data = file("files/installApache.sh")
  tags = {
    Name = "${var.server_name}-apache"
  }
}

resource "aws_instance" "tiendanube-nginx" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.ssh_key_name
  security_groups = [
    aws_security_group.ec2-sg.id]
  subnet_id = aws_subnet.subnet2.id
  user_data = file("files/installNginx.sh")
  tags = {
    Name = "${var.server_name}-nginx"
  }
}
