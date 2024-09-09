output "ssm_vpc_id" {
  value = aws_ssm_parameter.vpc.id
}

output "ssm_pvt_subnet_1a" {
  value = aws_ssm_parameter.private-1a.id
}

output "ssm_pvt_subnet_1b" {
  value = aws_ssm_parameter.private-1b.id
}

output "ssm_pvt_subnet_1c" {
  value = aws_ssm_parameter.private-1c.id
}

output "ssm_pub_subnet_1a" {
  value = aws_ssm_parameter.public-1a.id
}

output "ssm_pub_subnet_1b" {
  value = aws_ssm_parameter.public-1b.id
}

output "ssm_pub_subnet_1c" {
  value = aws_ssm_parameter.public-1c.id
}

output "ssm_db_subnet_1a" {
  value = aws_ssm_parameter.db-1a.id
}

output "ssm_db_subnet_1b" {
  value = aws_ssm_parameter.db-1b.id
}

output "ssm_db_subnet_1c" {
  value = aws_ssm_parameter.db-1c.id
}