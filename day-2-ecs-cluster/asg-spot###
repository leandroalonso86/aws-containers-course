resource "aws_autoscaling_group" "ecs-cluster_spot" {
  name_prefix = format("%s-ecs-cluster_spot", var.project_name)

  min_size = var.cluster_spot_min_size
  max_size = var.cluster_spot_max_size
  desired_capacity = var.cluster_spot_desired_size

  vpc_zone_identifier = [
    data.aws_ssm_parameter.private-1a.value,
    data.aws_ssm_parameter.private-1b.value,
    data.aws_ssm_parameter.private-1c.value
  ]

  launch_template {
    id      = aws_launch_template.ecs-spot.id
    version = aws_launch_template.ecs-spot.latest_version
  }

  tag {
    key                 = "Name"
    value               = format("%s-ecs-cluster-spot", var.project_name)
    propagate_at_launch = true
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = true
    propagate_at_launch = true
  }
}

resource "aws_ecs_capacity_provider" "spot" {
  name = format("%s_ecs_cp_spot", var.project_name)
  
  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.ecs-cluster_spot.arn

    managed_scaling {
      maximum_scaling_step_size = 10
      minimum_scaling_step_size = 1
      status = "ENABLED"
      target_capacity = 90
    }
  }
}