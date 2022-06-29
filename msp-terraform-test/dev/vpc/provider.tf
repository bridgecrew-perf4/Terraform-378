provider "aws" {
  region  = "ap-northeast-2"
}

terraform {
  backend "s3" {
      bucket         = "tf-msp-apne2-tfstate"
      key            = "vpc/terraform.tfstate"
      region         = "ap-northeast-2"
      encrypt        = true
      dynamodb_table = "tf-up-and-running-lock"
  }
}
