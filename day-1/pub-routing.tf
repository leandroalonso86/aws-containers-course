resource "aws_route_table" "public-access" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = format("%s-pub-rt", var.project_name)
  }
}

resource "aws_route" "public-access" {
  route_table_id         = aws_route_table.public-access.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.pub-igw.id
}

resource "aws_route_table_association" "pub-1a" {
  subnet_id = aws_subnet.pub-subnet-1a.id
  route_table_id = aws_route_table.public-access.id
}

resource "aws_route_table_association" "pub-1b" {
  subnet_id = aws_subnet.pub-subnet-1b.id
  route_table_id = aws_route_table.public-access.id
}

resource "aws_route_table_association" "pub-1c" {
  subnet_id = aws_subnet.pub-subnet-1c.id
  route_table_id = aws_route_table.public-access.id
}