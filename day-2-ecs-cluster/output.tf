output "load-balancer-dns" {
  value = aws_lb.ecs-lb.name
}

output "load-balancer-arn" {
  value = aws_ssm_parameter.lb-arn.arn
}

output "load-balancer-listener-arn" {
  value = aws_ssm_parameter.lb-listener-arn.arn
}