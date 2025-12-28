terraform {
 required_providers {
   aws = {
     source = "hashicorp/aws"
     version = "~> 6.0"
   }
 }


#store .tfstate file in s3 bucket

backend "s3"{
  bucket = "terraform-bucket-akash-12345"
  key    = "terraform.tfstate"
  region = "us-east-1"
  dynamodb_table = "MyDynamoDBTable"


}
}