resource "aws_ecs_cluster" "cluster-01" {
  name = format("%s-cluster-01", var.project_name)
  setting {
    name = "containerInsights"
    value = "enabled"
  }
}

resource "aws_security_group" "ecs-cluster" {
  name   = format("%s-ecs-cluster", var.project_name)
  vpc_id = data.aws_ssm_parameter.vpc.value

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}

resource "aws_security_group_rule" "ranges" {
  cidr_blocks       = ["10.0.0.0/16"]
  from_port         = 0
  to_port           = 0
  description       = "VPC Access"
  protocol          = "-1"
  security_group_id = aws_security_group.ecs-cluster.id
  type              = "ingress"
}