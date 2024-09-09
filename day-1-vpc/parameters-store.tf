resource "aws_ssm_parameter" "vpc" {
  name = format("/%s/vpc/vpc_id", var.project_name)
  type = "String"
  value = aws_vpc.main.id
}

resource "aws_ssm_parameter" "private-1a" {
  name = format("/%s/vpc/pvt-subnet-1a", var.project_name)
  type = "String"
  value = aws_subnet.pvt-subnet-1a.id
}

resource "aws_ssm_parameter" "private-1b" {
  name = format("/%s/vpc/pvt-subnet-1b", var.project_name)
  type = "String"
  value = aws_subnet.pvt-subnet-1b.id
}

resource "aws_ssm_parameter" "private-1c" {
  name = format("/%s/vpc/pvt-subnet-1c", var.project_name)
  type = "String"
  value = aws_subnet.pvt-subnet-1c.id
}

resource "aws_ssm_parameter" "public-1a" {
  name = format("/%s/vpc/pub-subnet-1a", var.project_name)
  type = "String"
  value = aws_subnet.pub-subnet-1a.id
}

resource "aws_ssm_parameter" "public-1b" {
  name = format("/%s/vpc/pub-subnet-1b", var.project_name)
  type = "String"
  value = aws_subnet.pub-subnet-1b.id
}

resource "aws_ssm_parameter" "public-1c" {
  name = format("/%s/vpc/pub-subnet-1c", var.project_name)
  type = "String"
  value = aws_subnet.pub-subnet-1c.id
}

resource "aws_ssm_parameter" "db-1a" {
  name = format("/%s/vpc/db-subnet-1a", var.project_name)
  type = "String"
  value = aws_subnet.db-subnet-1a.id
}

resource "aws_ssm_parameter" "db-1b" {
  name = format("/%s/vpc/db-subnet-1b", var.project_name)
  type = "String"
  value = aws_subnet.db-subnet-1b.id
}

resource "aws_ssm_parameter" "db-1c" {
  name = format("/%s/vpc/db-subnet-1c", var.project_name)
  type = "String"
  value = aws_subnet.db-subnet-1c.id
}