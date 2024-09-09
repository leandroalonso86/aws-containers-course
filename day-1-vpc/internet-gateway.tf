resource "aws_internet_gateway" "pub-igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = format("%s-igw", var.project_name)
  }
}