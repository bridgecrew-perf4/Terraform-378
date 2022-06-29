resource "aws_iam_user" "msp-admin" {
  name = "msp-admin"
}

resource "aws_iam_user_policy" "super-admin" {
  name  = "super-admin"
  user  = aws_iam_user.msp-admin.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "*"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
EOF
}
