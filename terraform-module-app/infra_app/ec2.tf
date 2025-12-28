#key
resource "aws_key_pair" "my_key"{
    key_name ="${var.env}-infra-app-key"
    public_key =file("C:/Users/akash/OneDrive/Desktop/practice/terraform-devops/terraform_key.pub")
    tags={
        Name ="${var.env}-infra-app-key"
        environment = var.env
    }
}
#vpc security group and ec2 instance
resource aws_default_vpc "default"{
    tags ={
        Name="default_vpc"
    }
}
resource "aws_security_group" "my_security_group"{
    name ="${var.env}-infra-app-sg"
    description ="this is for ec2 instance"
    vpc_id =aws_default_vpc.default.id 
    #ingress rules
    ingress {
        from_port=22
        to_port=22
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
       
       
    }
    ingress {
        from_port=80
        to_port=80
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
       
    }
    #egress rules
    egress{
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
    tags={
        Name="${var.env}-infra-app-sg"
        environment = var.env
    }
}

resource "aws_instance" "my_instance"{
   count=var.instance_count
    ami= var.ami_id
    instance_type=var.instance_type
    key_name= aws_key_pair.my_key.key_name
    security_groups=[aws_security_group.my_security_group.name]
  
    root_block_device{
        volume_size=var.env == "prd" ? 20 : var.storage_size
        volume_type="gp3"
        delete_on_termination=true
    }
    tags={
        Name="${var.env}-infra-app-ec2"
        environment = var.env
    }

}