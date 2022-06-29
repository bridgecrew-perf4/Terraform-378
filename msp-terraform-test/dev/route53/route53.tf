# route53의 새로운 zone을 생성
resource "aws_route53_zone" "myRoute53" {
    name = "young-dev.com"
}

# 생성한 zone에 새로운 record를 생성
# A Type으로 alias(dualstack.[dns_name]) 를 생성
resource "aws_route53_record" "myRoute53Record" {
    name = format("%s.%s", "cccr", aws_route53_zone.myRoute53.name)
    type = "A"
    zone_id = aws_route53_zone.myRoute53.id

    alias {
        evaluate_target_health = true
        name = format("%s.%s", "dualstack", aws_lb.myLb.dns_name)
        zone_id = aws_lb.myLb.zone_id
    }
}
