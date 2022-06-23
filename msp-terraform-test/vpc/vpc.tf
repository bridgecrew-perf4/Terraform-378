resource "aws_vpc" "main" {
  cidr_block       = "192.168.10.0/24"

  tags = {
    Name = "terraform-vpc"
  }
}
