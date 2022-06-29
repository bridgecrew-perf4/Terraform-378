# Admin이 연결할 EC2에 적용할 보안그룹을 생성
resource "aws_security_group" "myBastion_sg" {
    name = "bastion_security_group"
    vpc_id = "${data.terraform_remote_state.vpc.outputs.vpc_id}"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
}

# 웹 서버가 구동될 EC2들에 적용할 보안그룹을 생성
resource "aws_security_group" "myweb_sg" {
    name = "web_security_group"
    vpc_id = "${data.terraform_remote_state.vpc.outputs.vpc_id}"

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        security_groups = [ aws_security_group.myBastion_sg.id ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
}

# Load Balancer에 적용할 보안그룹을 생성
resource "aws_security_group" "myalb_sg" {
    name = "alb_security_group"
    vpc_id = "${data.terraform_remote_state.vpc.outputs.vpc_id}"


    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
}
