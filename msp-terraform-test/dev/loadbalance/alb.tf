# Load Balancer를 생성 (ELB를 생성할 수도 있지만 여기서는 ALB를 생성한다.)
# ELB에 대한 코드는 다른 포스팅에서 확인할 수 있다.
resource "aws_lb" "myLb" {
    name = "buha-alb"
    internal = false
    load_balancer_type = "application"
    subnets = aws_subnet.public_subnet.*.id
}

# Load Balancer에 설정할 Listener를 생성
resource "aws_lb_listener" "myListener" {
    load_balancer_arn = aws_lb.myLb.arn
    
    # 즉, tcp/80 포트로 트래픽이 들어오면 default_action을 수행
    port = 80
    protocol = "TCP"

    default_action {
    	# default_action은 aws_lb_target_group으로 forward해라!! 라는 거다.
        target_group_arn = aws_lb_target_group.myTarget.arn
        type = "forward"
    }
}

# 위에서 설명한 aws_lb_target_group을 지정해, Listener가 수행할 Action의 Target을 생성
resource "aws_lb_target_group" "myTarget" {
    name = "target-group"
    port = 8080
    protocol = "TCP"
    vpc_id = aws_vpc.main.id
    target_type = "instance"

    health_check {
        port = "traffic-port"
        protocol = "TCP"
    }
}

# Target을 생성했음 붙여야지! 여기서 원래 count를 1로 고정하면 안되는데...
# 고정안하면 에러가나서 ㅠㅠ 우선은 이렇게 넘어간다!!
# 원래는 data "aws_instances" "test" 를 통해 ASG로 생성된 Instance들을 긁어오고,
# 긁어온 모든 EC2 Instance들에게 Target Group을 부착을 해줘야 한다.
resource "aws_lb_target_group_attachment" "myTargetAttachment" {
    count = 1

    target_group_arn = aws_lb_target_group.myTarget.arn
    target_id = element(data.aws_instances.test.ids, count.index)
    depends_on = [ data.aws_instances.test ]
}

data "aws_instances" "test" {
    instance_tags = {
        "aws:autoscaling:groupName" = aws_autoscaling_group.myAsg.name
    }
    depends_on = [ aws_launch_configuration.myLaunchConfig ]
}
