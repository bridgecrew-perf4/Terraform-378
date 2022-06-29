resource "aws_subnet" "public_subnet" {
  count = length(var.aws_public_subnets) 
  vpc_id     = aws_vpc.main.id
  cidr_block = var.aws_public_subnets[count.index]
  availability_zone = var.aws_azs[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "terraform-pu-${count.index}"
  }
}

resource "aws_subnet" "private_subnet" {
  count = length(var.aws_private_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.aws_private_subnets[count.index]
  availability_zone = var.aws_azs[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "terraform-pr-${count.index}"
  }
}

