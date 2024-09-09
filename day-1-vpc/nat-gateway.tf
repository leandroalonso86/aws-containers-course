resource "aws_eip" "eip-1a" {
  domain = "vpc"
  tags = {
    Name = format("%s-eip-1a", var.project_name)
  }
}

resource "aws_nat_gateway" "nat-gw-1a" {
  allocation_id = aws_eip.eip-1a.id
  subnet_id     = aws_subnet.pub-subnet-1a.id
  tags = {
    Name = format("%s-nat-gw-1a", var.project_name)
  }
}

resource "aws_eip" "eip-1b" {
  domain = "vpc"
  tags = {
    Name = format("%s-eip-1b", var.project_name)
  }
}

resource "aws_nat_gateway" "nat-gw-1b" {
  allocation_id = aws_eip.eip-1b.id
  subnet_id     = aws_subnet.pub-subnet-1b.id
  tags = {
    Name = format("%s-nat-gw-1b", var.project_name)
  }
}

resource "aws_eip" "eip-1c" {
  domain = "vpc"
  tags = {
    Name = format("%s-eip-1c", var.project_name)
  }
}

resource "aws_nat_gateway" "nat-gw-1c" {
  allocation_id = aws_eip.eip-1c.id
  subnet_id     = aws_subnet.pub-subnet-1c.id
  tags = {
    Name = format("%s-nat-gw-1c", var.project_name)
  }
}