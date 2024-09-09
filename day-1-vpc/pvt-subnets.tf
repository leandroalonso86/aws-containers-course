resource "aws_subnet" "pvt-subnet-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/20"
  availability_zone = format("%sa", var.region)
  tags = {
    Name = format("%s-pvt-subnet-1a", var.region)
  }
}

resource "aws_subnet" "pvt-subnet-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.16.0/20"
  availability_zone = format("%sb", var.region)
  tags = {
    Name = format("%s-pvt-subnet-1b", var.region)
  }
}

resource "aws_subnet" "pvt-subnet-1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/20"
  availability_zone = format("%sc", var.region)
  tags = {
    Name = format("%s-pvt-subnet-1c", var.region)
  }
}
