resource "aws_ecs_service" "service-01" {
  name = var.service_name

  cluster = var.cluster_name

  task_definition = aws_ecs_task_definition.ecs_task_01.id

  desired_count = var.service_task_count

  launch_type = var.service_launch_type

  deployment_maximum_percent = 200

  deployment_minimum_healthy_percent = 100

  deployment_circuit_breaker {
    enable = true
    rollback = true
  }

  network_configuration {
    security_groups = [ 
        aws_security_group.ecs-service-sg.id
     ]

    subnets = [ 
        var.private_subnets
     ]

    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.tg-ecs.id
    container_name = var.service_name
    container_port = var.service_port
  }

  platform_version = "latest"

  lifecycle {
    ignore_changes = [ 
        desired_count
     ]
  }

  depends_on = [  ]

}