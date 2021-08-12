provider "aws" {
    region = "sa-east-1"
}

resource "aws_instance" "terraformec2" {
    ami = "ami-0f8243a5175208e08"
    instance_type = "t2.micro"
}

resource "aws_eip" "elasticeip" {
    instance = aws_instance.terraformec2.id
}

output "eip" {
    value = aws_eip.elasticeip.public_ip
}