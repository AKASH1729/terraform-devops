# output "ec2_public_ip" {
#   description = "The public IP address of the EC2 instance"
#   value       = aws_instance.my_instance[*].public_ip
# }
# output "ec2_dns"{
#     description="The public DNS of the EC2 instance"
#     value=aws_instance.my_instance[*].public_dns
# }
output "ec2_private_ip"{
    value = [
    for instance in aws_instance.my_instance : instance.public_ip
 ]
 }
