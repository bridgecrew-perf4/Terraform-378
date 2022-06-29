# CloudFront Distribution을 생성
resource "aws_cloudfront_distribution" "myCloudFront" {
	# 이게 아마 Default Origin을 생성하는 과정인걸로...?
    origin {
        domain_name = aws_s3_bucket.original.bucket_domain_name
        origin_id = "chanjun-project"
        
        # 이건 도통 뭔지 모르겠음...ㅠ 일단 임의로 넣어주긴함(잘됨)
        s3_origin_config {
            origin_access_identity = aws_cloudfront_origin_access_identity.chanjun-origin-access.cloudfront_access_identity_path
        }
    }

    enabled = true
	
    default_cache_behavior {
        allowed_methods = [ "GET", "HEAD" ]
        cached_methods = [ "GET", "HEAD" ]
        target_origin_id = "chanjun-project"
        viewer_protocol_policy = "allow-all"
        forwarded_values {
            query_string = false
            headers = [ "Origin", "Access-Control-Request-Headers", "Access-Control-Request-Method" ]
            cookies {
                forward = "none"
            }
        }
    }

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }
    viewer_certificate {
        cloudfront_default_certificate = true
    }
    retain_on_delete = true
}

data "aws_iam_policy_document" "s3_policy" {
    statement {
        actions = [ "s3:GetObject" ]
        resources = [ "${aws_s3_bucket.original.arn}/*" ]
        effect = "Allow"
        principals {
            identifiers = [ "*" ]
            type = "*"
        }
    }
    statement {
        actions = [ "s3:GetObject" ]
        resources = [ "${aws_s3_bucket.original.arn}/*" ]
        principals {
            identifiers = [ aws_cloudfront_origin_access_identity.chanjun-origin-access.iam_arn ]
            type = "AWS"
        }
    }
}

# 이것도 왜만든거지ㅋㅋㅋㅋ 기억상실증..
resource "aws_s3_bucket_policy" "example" {
    bucket = aws_s3_bucket.original.id
    policy = data.aws_iam_policy_document.s3_policy.json
}

# 임의로 생성.. 뭔지 모르겠다
resource "aws_cloudfront_origin_access_identity" "chanjun-origin-access" {
    comment = "chanjun-project"
}
