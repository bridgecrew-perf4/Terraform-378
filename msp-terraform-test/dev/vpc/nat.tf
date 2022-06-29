resource "aws_eip" "nat_1" {
  vpc   = true

  lifecycle {
    create_before_destroy = true
  }
 tags = {
   Name = "terraform-nat"
 }
}

resource "aws_nat_gateway" "nat_gateway_1" {
  allocation_id = aws_eip.nat_1.id
  subnet_id = aws_subnet.public_subnet.0.id

  tags = {
    Name = "terraform-nat"
  }
}
