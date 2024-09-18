resource "aws_appautoscaling_target" "service-autoscale" {
  min_capacity = var.task_min
  
  max_capacity = var.task_max

  resource_id = "service/${var.cluster_name}/${var.service_name}"

  scalable_dimension = "ecs:service:DesiredCount"

  service_namespace = "ecs"

}

