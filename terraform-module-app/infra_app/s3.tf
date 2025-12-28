resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.env}-${var.bucket_name}"
  

  tags = {
    Name        = "MyTerraformBucket"
    environment = var.env
   
  }
}