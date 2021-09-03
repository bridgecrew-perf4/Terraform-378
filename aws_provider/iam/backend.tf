terraform {
    backend "s3" {
      bucket         = "tf-lewis-apne2-tfstate"
      key            = "aws_provider/iam/terraform.tfstate"
      region         = "ap-northeast-2"
      encrypt        = true
      dynamodb_table = "terraform-lock"
    }
}
