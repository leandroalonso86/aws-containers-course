resource "aws_autoscaling_group" "ecs-cluster" {
  name_prefix = format("%s-ecs-cluster", var.project_name)

  min_size = var.cluster_min_size
  max_size = var.cluster_max_size
  desired_capacity = var.cluster_desired_size

  vpc_zone_identifier = [
    data.aws_ssm_parameter.private-1a.value,
    data.aws_ssm_parameter.private-1b.value,
    data.aws_ssm_parameter.private-1c.value
  ]

  launch_template {
    id      = aws_launch_template.ecs-on-demand.id
    version = aws_launch_template.ecs-on-demand.latest_version
  }

  tag {
    key                 = "Name"
    value               = format("%s-ecs-cluster-asg", var.project_name)
    propagate_at_launch = true
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = true
    propagate_at_launch = true
  }
}