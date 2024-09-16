resource "aws_alb_target_group" "tg-ecs" {
  name = format("ecs-%s", var.service_name)
  port = var.service_port
  vpc_id = var.vpc_id
  protocol = "HTTP"
  target_type = "ip"

  health_check {
    healthy_threshold = lookup(var.service_healthcheck, "healthy_threshold")
    unhealthy_threshold = lookup(var.service_healthcheck, "unhealthy_threshold")
    timeout = lookup(var.service_healthcheck, "timeout")
    interval = lookup(var.service_healthcheck, "interval")
    matcher = lookup(var.service_healthcheck, "matcher")
    path = lookup(var.service_healthcheck, "path")
    port = lookup(var.service_healthcheck, "port")
  }

  lifecycle {
    create_before_destroy = false
  }

}