provider "aws" {
  region = "ap-northeast-2" # Please use the default region ID
}

# S3 bucket for backend
resource "aws_s3_bucket" "tfstate" {
  bucket = "tf-msp-apne2-tfstate"

  versioning {
    enabled = true # Prevent from deleting tfstate file
  }
     lifecycle {
        prevent_destroy = true
    }
}

resource "aws_dynamodb_table" "terraform_lock" {
	name = "tf-up-and-running-lock"
    hash_key = "LockID"
    read_capacity = 2
    write_capacity = 2

    attribute {
    	name = "LockID"
        type = "S"
    }
}
