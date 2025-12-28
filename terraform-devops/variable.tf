variable "ami_id" {
  type        = string
    description = "The AMI ID for the EC2 instance"
    default     = "ami-0ecb62995f68bb549" # Example AMI ID, replace with a valid one for your region
}
variable "instance_type" {
  type        = string
    description = "The instance type for the EC2 instance"
    default     = "t3.micro"
}
variable "storage_size" {
  type        = number
    description = "The size of the root EBS volume in GB"
    default     = 15

}
variable "env"{
    default = "prd"
    type    = string
}
