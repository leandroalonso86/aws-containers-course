data "aws_ssm_parameter" "vpc" {
  name = var.ssm_vpc_id
}

data "aws_ssm_parameter" "private-1a" {
  name = var.ssm_pvt_subnet_1a
}

data "aws_ssm_parameter" "private-1b" {
  name = var.ssm_pvt_subnet_1b
}

data "aws_ssm_parameter" "private-1c" {
  name = var.ssm_pvt_subnet_1c
}

data "aws_ssm_parameter" "public-1a" {
  name = var.ssm_pub_subnet_1a
}

data "aws_ssm_parameter" "public-1b" {
  name = var.ssm_pub_subnet_1b
}

data "aws_ssm_parameter" "public-1c" {
  name = var.ssm_pub_subnet_1c
}