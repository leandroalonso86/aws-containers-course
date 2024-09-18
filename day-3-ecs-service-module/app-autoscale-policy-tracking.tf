resource "aws_appautoscaling_policy" "tracking" {
  name               = format("%s-%s-tracking-scale-out", var.cluster_name, var.service_name)
  count              = var.scale_type == "cpu_tracking" ? 1 : 0
  resource_id        = aws_appautoscaling_target.service-autoscale.resource_id
  service_namespace  = aws_appautoscaling_target.service-autoscale.service_namespace
  scalable_dimension = aws_appautoscaling_target.service-autoscale.scalable_dimension

  policy_type = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    target_value       = var.scale_tracking_cpu
    scale_out_cooldown = var.scale_out_cooldown
    scale_in_cooldown  = var.scale_in_cooldown

    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

  }

}