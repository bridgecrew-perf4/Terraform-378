# vpc 생성
resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"

  tags = {
    Name = "terraform-01"
  }
}

# public 서브넷 생성
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"

  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "terraform-01-public_subnet"
  }
}

# private 서브넷 생성
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.10.0/24"

  tags = {
    Name = "terraform-01-private_subnet"
  }
}


# igw 생성. 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terrafrom-igw"
  }
}

# eip 생성
resource "aws_eip" "nat" {
  vpc   = true

  lifecycle {
    create_before_destroy = true
  }
}

# nat gateway 생성
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat.id

  # Private subnet이 아니라 public subnet을 연결해야 한다.
  subnet_id = aws_subnet.public_subnet.id

  tags = {
    Name = "NAT-GW"
  }
}

# public route table 생성
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  # route rule을 table 안에 명시 한 경우.
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "route-table-public"
  }
}

# subnet 연결
resource "aws_route_table_association" "route_table_association_public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}


# private route table 생성
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "route-table-private"
  }
}

# subnet 연결
resource "aws_route_table_association" "route_table_association_private" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private.id
}

# route rule을 외부에 명시한 경우. 코드의 확장성을 위해선 아래와 같이 명시해주는게 좋음.
resource "aws_route" "private_nat" {
  route_table_id              = aws_route_table.private.id
  destination_cidr_block      = "0.0.0.0/0"
  nat_gateway_id              = aws_nat_gateway.nat_gateway.id
}
