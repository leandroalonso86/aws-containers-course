resource "aws_launch_template" "ecs-spot" {
  name_prefix = format("%s-spot", var.project_name)

  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price = "0.0133"
    }
  }

  instance_type = var.node_instance_type

  image_id = var.node_ami

  vpc_security_group_ids = [
    aws_security_group.ecs-cluster.id
  ]

  iam_instance_profile {
    name = aws_iam_instance_profile.ecsInstanceProfile.name
  }

  update_default_version = true

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = var.node_volume_size
      volume_type = var.node_volume_type
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = format("%s-on-demand", var.project_name)
    }
  }

  user_data = base64encode(templatefile("${path.module}/templates/user-data.tpl", {
    CLUSTER_NAME = aws_ecs_cluster.cluster-01.name
  }))
}