# Public Subnet에 부여할 CIDR 목록을 변수로 생성
variable "aws_public_subnets" {
  default = [ "192.168.10.0/26", "192.168.10.64/26" ]
    
}

# Private Subnet에 부여할 CIDR 목록을 변수로 생성
variable "aws_private_subnets" {
  default = [ "192.168.10.128/26", "192.168.10.192/26" ]
}

# VPC가 존재할 가용 영역 목록을 변수로 생성
variable "aws_azs" {
  default = [ "ap-northeast-2a", "ap-northeast-2b" ]
}
