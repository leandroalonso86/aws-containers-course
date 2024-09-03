resource "aws_subnet" "pub-subnet-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.48.0/24"
  availability_zone = format("%sa", var.region)
  tags = {
    Name = format("%s-pub-subnet-1a", var.region)
  }
}

resource "aws_subnet" "pub-subnet-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.49.0/24"
  availability_zone = format("%sb", var.region)
  tags = {
    Name = format("%s-pub-subnet-1b", var.region)
  }
}

resource "aws_subnet" "pub-subnet-1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.50.0/24"
  availability_zone = format("%sc", var.region)
  tags = {
    Name = format("%s-pub-subnet-1c", var.region)
  }
}
