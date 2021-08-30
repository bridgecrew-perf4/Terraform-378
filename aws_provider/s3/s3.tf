resource "aws_s3_bucket" "main" { 
  bucket = "freey-s3-01" 
  tags = { 
    Name = "freey-s3-01" 
  } 
}
