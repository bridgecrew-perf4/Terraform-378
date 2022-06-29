# 웹 서버가 구동될 EC2들을 Auto Scaling하기 위한 Auto Scaling Group 생성
resource "aws_autoscaling_group" "myAsg" {
    launch_configuration = aws_launch_configuration.myLaunchConfig.id
    health_check_type = "ELB"
    # *를 통해 모든 Private Subnet을 Auto Scaling할 AZ의 범위를 지정
    vpc_zone_identifier = "${data.terraform_remote_state.vpc.outputs.private_subnet_id.*}"

    min_size = 1
    max_size = 5

    tag {
        key = "Name"
        value = "buhatest"
        propagate_at_launch = true
    }
}
