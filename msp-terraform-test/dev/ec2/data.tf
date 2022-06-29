data "terraform_remote_state" "vpc" {
  backend = "s3" 
  config = {
      bucket         = "tf-msp-apne2-tfstate"
      key            = "vpc/terraform.tfstate"
      region         = "ap-northeast-2"
      encrypt        = true
      dynamodb_table = "tf-up-and-running-lock"
  }
}
