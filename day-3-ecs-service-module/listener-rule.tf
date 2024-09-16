resource "aws_alb_listener_rule" "rule-01" {
  listener_arn = var.service_listener

  action {
    type = "forward"
    target_group_arn = aws_alb_target_group.tg-ecs.id
  }

  condition {
    host_header {
      values = var.service_hosts
    }
  }

}