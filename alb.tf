resource "aws_alb_target_group" "alb-tg-tiendanube" {
  name     = "alb-tg-tiendanube"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc-tiendanube.id
}

resource "aws_lb_target_group_attachment" "alb-tg-attch-apache-tiendanube" {
  target_group_arn = aws_alb_target_group.alb-tg-tiendanube.arn
  target_id        = aws_instance.tiendanube-apache.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "alb-tg-attch-nginx-tiendanube" {
  target_group_arn = aws_alb_target_group.alb-tg-tiendanube.arn
  target_id        = aws_instance.tiendanube-nginx.id
  port             = 80
}

resource "aws_alb" "alb-tiendanube" {
  name            = "alb-tiendanube"
  load_balancer_type = "application"
  internal           = false
  subnets         = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  security_groups = [aws_security_group.lb-sg.id]
}

resource "aws_alb_listener" "alb-listener-tiendanube" {
  load_balancer_arn = aws_alb.alb-tiendanube.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.alb-tg-tiendanube.id
    type             = "forward"
  }
}