output "lb_address" {
  value = aws_alb.alb-tiendanube.dns_name
}

output "instances_ip" {
  value = [aws_eip.ip-tiendanube-apache.public_ip,
            aws_eip.ip-tiendanube-nginx.public_ip
  ]
}
