#-------------------------------------------
#hàng terrform và provider luon có để pit mình sẽ thực hiện trên aws hay googlge => tạo thư viện 
terraform {
required_providers  {
    aws = {
    source = "hashicorp/aws"
    version = "~> 3.27"
}
}
}

provider "aws" {
    region = "us-east-1"
  
}
#-----------------------------------
# tạo ec2 => cần có ami type va  name 
locals {
    ami = "ami-052efd3df9dad4825"
    instance_type = "t2.micro"
    name = "demo-lab1-local" # này là tên của ec2
}
resource "aws_instance" "myapp" {
    ami = local.ami #cái local phía trên 
    instance_type = local.instance_type
    tags = {
    Name = local.name
}
}