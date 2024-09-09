resource "aws_subnet" "db-subnet-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.51.0/24"
  availability_zone = format("%sa", var.region)
  tags = {
    Name = format("%s-db-subnet-1a", var.region)
  }
}

resource "aws_subnet" "db-subnet-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.52.0/24"
  availability_zone = format("%sb", var.region)
  tags = {
    Name = format("%s-db-subnet-1b", var.region)
  }
}

resource "aws_subnet" "db-subnet-1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.53.0/24"
  availability_zone = format("%sc", var.region)
  tags = {
    Name = format("%s-db-subnet-1c", var.region)
  }
}
