resource "aws_route_table" "pu_route_table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terrafrom-pu"
  }
}

resource "aws_route_table_association" "pu_route_table_association_1" {
  subnet_id      = aws_subnet.public_subnet-01.id
  route_table_id = aws_route_table.pu_route_table.id
}

resource "aws_route_table_association" "pu_route_table_association_2" {
  subnet_id      = aws_subnet.public_subnet-02.id
  route_table_id = aws_route_table.pu_route_table.id
}

resource "aws_route_table" "pr_route_table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terraform-pr"
  }
}

resource "aws_route_table_association" "pr_route_table_association_1" {
  subnet_id      = aws_subnet.private_subnet-01.id
  route_table_id = aws_route_table.pr_route_table.id
}

resource "aws_route_table_association" "pr_route_table_association_2" {
  subnet_id      = aws_subnet.private_subnet-02.id
  route_table_id = aws_route_table.pr_route_table.id
}
