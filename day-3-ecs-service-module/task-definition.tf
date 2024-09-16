resource "aws_ecs_task_definition" "ecs_task_01" {
  family = format("%s-%s-td", var.cluster_name, var.service_name)

  network_mode = "awsvpc"

  requires_compatibilities = var.capabilities

  cpu    = var.service_cpu
  memory = var.service_memory

  execution_role_arn = aws_iam_role.service_role.arn
  task_role_arn      = var.service_task_role

  container_definitions = jsonencode([
    {
      name   = var.service_name
      image  = format("%s:latest", aws_ecr_repository.main.repository_url)
      cpu    = var.service_cpu
      memory = var.service_memory

      essential = true

      portMapping = [
        {
          containerPort = var.service_port
          hostPort      = var.service_port
          protocol      = "TCP"
        }
      ]

      logConfiguration = {
        logDriver = "awsLogs"
        option = {
          awslogs-group     = aws_cloudwatch_log_group.main.id
          awslogs-region    = var.region
          aws-stream-prefix = var.service_name
        }
      }

      environment = var.environment_variables

    }

  ])

}