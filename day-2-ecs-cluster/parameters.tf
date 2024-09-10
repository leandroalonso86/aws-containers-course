resource "aws_ssm_parameter" "lb-dns" {
  name  = format("/%s/ecs/lb/dns", var.project_name)
  type  = "String"
  value = aws_lb.ecs-lb.dns_name
}

resource "aws_ssm_parameter" "lb-arn" {
  name  = format("/%s/ecs/lb/arn", var.project_name)
  type  = "String"
  value = aws_lb.ecs-lb.arn
}

resource "aws_ssm_parameter" "lb-listener-arn" {
  name  = format("/%s/ecs/lb-listener/arn", var.project_name)
  type  = "String"
  value = aws_lb_listener.http.arn
}