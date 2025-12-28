variable "env" {
  type        = string
  description = "description of environment for infra_app"
}
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}
variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}
variable instance_count {
  description = "Number of EC2 instances to create"
  type        = number
  
}
variable storage_size {
  description = "Size of the root block device in GB"
  type        = number
}
variable instance_type {
  description = "Type of EC2 instance"
  type        = string
}
variable hash_key {
  description = "Hash key for DynamoDB table"
  type        = string
}
