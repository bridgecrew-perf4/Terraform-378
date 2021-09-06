terraform {
  required_version = "= 0.12.28"

  backend "s3" {
    bucket         = "tf-lewis-apne2-tfstate"
    key            = "aws_provisioning/vpc/atrd_apnortheast2/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}