resource "aws_subnet" "public_subnet-01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.10.0/26"

  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "terraform-pu-01"
  }
}

resource "aws_subnet" "public_subnet-02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.10.64/26"

  availability_zone = "ap-northeast-2b"

  tags = {
    Name = "terraform-pu-02"
  }
}

resource "aws_subnet" "private_subnet-01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.10.128/26"

  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "terraform-pr-01"
  }
}

resource "aws_subnet" "private_subnet-02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.10.192/26"

  availability_zone = "ap-northeast-2b"

  tags = {
    Name = "terraform-pr-02"
  }
}
