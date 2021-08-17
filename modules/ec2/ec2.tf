variable "ec2name" {
    type = string
}

resource "aws_instance" "terraformec2" {
    ami = "ami-0f8243a5175208e08"
    instance_type = "t2.micro"
    tags = {
      Name = var.ec2name
    }
}

output "instance_id" {
    value = aws_instance.terraformec2.id
}