######################
## PVT Routing - AZ 1a
######################

resource "aws_route_table" "private-access-1a" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = format("%s-pvt-rt-1a", var.project_name)
  }
}

resource "aws_route" "private-access-1a" {
  route_table_id         = aws_route_table.private-access-1a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat-gw-1a.id
}

resource "aws_route_table_association" "pvt-1a" {
  subnet_id = aws_subnet.pvt-subnet-1a.id
  route_table_id = aws_route_table.private-access-1a.id
}

######################
## PVT Routing - AZ 1b
######################

resource "aws_route_table" "private-access-1b" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = format("%s-pvt-rt-1b", var.project_name)
  }
}

resource "aws_route" "private-access-1b" {
  route_table_id         = aws_route_table.private-access-1b.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat-gw-1b.id
}

resource "aws_route_table_association" "pvt-1b" {
  subnet_id = aws_subnet.pvt-subnet-1b.id
  route_table_id = aws_route_table.private-access-1b.id
}

######################
## PVT Routing - AZ 1c
######################

resource "aws_route_table" "private-access-1c" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = format("%s-pvt-rt-1c", var.project_name)
  }
}

resource "aws_route" "private-access-1c" {
  route_table_id         = aws_route_table.private-access-1c.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat-gw-1c.id
}

resource "aws_route_table_association" "pvt-1c" {
  subnet_id = aws_subnet.pvt-subnet-1c.id
  route_table_id = aws_route_table.private-access-1c.id
}