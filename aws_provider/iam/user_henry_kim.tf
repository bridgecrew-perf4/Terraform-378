resource "aws_iam_user" "henry_kim" {
  name = "henry.kim"
}

resource "aws_iam_user_policy" "art_devops_black_henry" {
  name  = "super-admin"
  user  = aws_iam_user.henry_kim.name

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
