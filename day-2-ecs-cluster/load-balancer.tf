resource "aws_lb" "ecs-lb" {
  name   = format("%s-ingress", var.project_name)
  internal = var.load_balancer_internal
  load_balancer_type = var.load_balancer_type

  subnets = [ 
    data.aws_ssm_parameter.public-1a.value,
    data.aws_ssm_parameter.public-1b.value,
    data.aws_ssm_parameter.public-1c.value
   ]

  security_groups = [ 
    aws_security_group.lb.id
   ]

  enable_cross_zone_load_balancing = false
  enable_deletion_protection = false
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.ecs-lb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "containers-course"
      status_code = "200"
    }
  }
}

resource "aws_security_group" "lb" {
  name   = format("%s-load-balancer", var.project_name)
  vpc_id = data.aws_ssm_parameter.vpc.value

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}

resource "aws_security_group_rule" "ingress-80" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  to_port           = 80
  description       = "Open port 80"
  protocol          = "tcp"
  security_group_id = aws_security_group.lb.id
  type              = "ingress"
}