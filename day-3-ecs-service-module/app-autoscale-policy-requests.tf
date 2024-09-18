resource "aws_appautoscaling_policy" "requests" {
  name               = format("%s-%s-requests", var.cluster_name, var.service_name)
  count              = var.scale_type == "requests_tracking" ? 1 : 0
  resource_id        = aws_appautoscaling_target.service-autoscale.resource_id
  service_namespace  = aws_appautoscaling_target.service-autoscale.service_namespace
  scalable_dimension = aws_appautoscaling_target.service-autoscale.scalable_dimension

  policy_type = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    target_value       = var.scale_tracking_requests
    scale_out_cooldown = var.scale_out_cooldown
    scale_in_cooldown  = var.scale_in_cooldown

    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"
      resource_label = "${data.aws_alb.alb_arn.arn_suffix}/${aws_alb_target_group.tg-ecs.arn_suffix}"
    }

  }

}